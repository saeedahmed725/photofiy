import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/favorite/view/bloc/favorites_bloc.dart';
import 'package:photofiy/features/favorite/view/widgets/favorites_sliver_grid.dart';
import 'package:photofiy/features/home/view/widgets/error_sliver_view.dart';
import 'package:photofiy/features/home/view/widgets/loading_sliver_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return FavoritesFavoritesBuilder(key: const Key('favorites_builder'));
  }
}

class FavoritesFavoritesBuilder extends StatelessWidget {
  const FavoritesFavoritesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) {
        return previous.status != current.status ||
            previous.favorites.length != current.favorites.length ||
            previous.errorMessage != current.errorMessage;
      },
      builder: (context, state) {
        return switch (state.status) {
          FavoritesStatus.loading when state.favorites.isEmpty =>
            const LoadingSliverView(),
          FavoritesStatus.failure => ErrorSliverView(
            errorMessage: state.errorMessage,
          ),
          _ => FavoritesSliverGrid(state: state),
        };
      },
    );
  }
}
