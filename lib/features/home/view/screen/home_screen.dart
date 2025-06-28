import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/home/view/bloc/home_bloc.dart';
import 'package:photofiy/features/home/view/widgets/home_images_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  bool _isNearBottom = false;
  bool _isLoadingMore = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    // Optimized pagination with debouncing
    if (currentScroll >= (maxScroll * 0.9) &&
        !_isNearBottom &&
        !_isLoadingMore) {
      _isNearBottom = true;
      _isLoadingMore = true;

      final state = context.read<HomeBloc>().state;
      if (state.hasReachedMax == false && state.status != HomeStatus.loading) {
        context.read<HomeBloc>().add(LoadMoreImages());

        // Reset loading flag after a delay
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _isLoadingMore = false;
          }
        });
      }
    } else if (currentScroll < (maxScroll * 0.8)) {
      _isNearBottom = false;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeImagesBuilder(scrollController: _scrollController);
  }
}
