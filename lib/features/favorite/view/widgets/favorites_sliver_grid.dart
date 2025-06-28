import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:photofiy/config/routes/app_routes.dart';
import 'package:photofiy/features/favorite/view/bloc/favorites_bloc.dart';
import 'package:photofiy/features/home/view/widgets/image_card.dart';
import 'package:photofiy/features/home/view/widgets/sliver_grid_loading_indicator.dart';

class FavoritesSliverGrid extends StatelessWidget {
  final FavoritesState state;
  final ScrollController? controller;

  const FavoritesSliverGrid({super.key, required this.state, this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 120),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        pattern: [
          WovenGridTile(1),
          WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: state.favorites.length,
        (context, index) {
          if (index >= state.favorites.length) {
            return const SliverGridLoadingIndicator();
          }
          return BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (_, _) {
              return RepaintBoundary(
                child: Hero(
                  tag: 'image_${state.favorites[index].id}',
                  child: ImageCard(
                    key: ValueKey(state.favorites[index].id),
                    image: state.favorites[index],
                    isFavorite: context.read<FavoritesBloc>().isFavorite(
                      state.favorites[index].id,
                    ),
                    onFavoriteToggle: () {
                      context.read<FavoritesBloc>().add(
                        ToggleFavorite(state.favorites[index]),
                      );
                      context.read<FavoritesBloc>().add(LoadFavorites());
                    },
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.image,
                        extra: state.favorites[index],
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
