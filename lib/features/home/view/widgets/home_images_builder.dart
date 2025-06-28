import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/home/view/bloc/home_bloc.dart';
import 'package:photofiy/features/home/view/widgets/error_sliver_view.dart';
import 'package:photofiy/features/home/view/widgets/images_sliver_grid.dart';
import 'package:photofiy/features/home/view/widgets/loading_sliver_view.dart';

class HomeImagesBuilder extends StatelessWidget {
  final ScrollController scrollController;

  const HomeImagesBuilder({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.status != current.status ||
            previous.images.length != current.images.length ||
            previous.errorMessage != current.errorMessage;
      },
      builder: (context, state) {
        return switch (state.status) {
          HomeStatus.loading when state.images.isEmpty =>
            const LoadingSliverView(),
          HomeStatus.failure => ErrorSliverView(
            errorMessage: state.errorMessage,
          ),
          _ => ImagesSliverGrid(state: state, controller: scrollController),
        };
      },
    );
  }
}
