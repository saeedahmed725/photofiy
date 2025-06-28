import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photofiy/core/services/locator.dart';
import 'package:photofiy/features/favorite/view/bloc/favorites_bloc.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/image/view/screens/image_screen.dart';

import '../../features/home/view/bloc/home_bloc.dart';
import '../../features/home/view/screen/main_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Route paths
  static const String splash = '/';
  static const String home = '/home';
  static const String image = '/image';

  // GoRouter configuration
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        name: home,
        path: home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<FavoritesBloc>(
              create: (context) =>
                  ServiceLocator.sl<FavoritesBloc>()..add(LoadFavorites()),
            ),
            BlocProvider<HomeBloc>(
              create: (context) =>
                  ServiceLocator.sl<HomeBloc>()..add(LoadInitialImages()),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
      GoRoute(
        name: image,
        path: image,
        builder: (context, state) {
          final image = state.extra as PixabayImage?;
          if (image == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Image Not Found')),
              body: const Center(child: Text('No image data provided')),
            );
          }
          return ImageScreen(image: image);
        },
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Offset? begin;
  @override
  final RouteSettings settings;

  SlideRoute({required this.page, required this.settings, this.begin})
    : super(
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        settings: settings,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin ?? const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
      );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  @override
  final RouteSettings settings;

  FadeRoute({required this.page, required this.settings})
    : super(
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        settings: settings,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
      );
}
