import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/core/constants/app_color.dart';
import 'package:photofiy/features/favorite/view/screen/favorite_screen.dart';
import 'package:photofiy/features/home/view/bloc/home_bloc.dart';
import 'package:photofiy/features/home/view/screen/home_screen.dart';
import 'package:photofiy/features/home/view/widgets/circles.dart';
import 'package:photofiy/features/home/view/widgets/glass_bottom_nav.dart';
import 'package:photofiy/features/home/view/widgets/glass_search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [const HomeScreen(), const FavoriteScreen()];
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      activeIcon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kDarkBlueColor,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: GlassSearchBar(
          onCategoryTap: (value) {
            context.read<HomeBloc>().add(SearchImages(value));
          },
          onSuggestionTap: (value) {
            context.read<HomeBloc>().add(SearchImages(value));
          },
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              context.read<HomeBloc>().add(SearchImages(value.trim()));
            }
          },
          onChanged: (value) {
            // Optionally trigger search on text change with debouncing
            // For now, we'll keep it simple and only search on submit
          },
          onClear: () {
            // context.read<HomeBloc>().add(ClearSearch());
          },
          suggestions: context.read<HomeBloc>().getSearchHistory(),
        ),
        body: Stack(
          children: [
            CirclesBackground(),
            IndexedStack(index: _currentIndex, children: _screens),
          ],
        ),
        bottomNavigationBar: GlassBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: items,
        ),
      ),
    );
  }
}
