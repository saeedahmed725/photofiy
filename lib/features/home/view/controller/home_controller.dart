// import 'package:flutter/material.dart';
// import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
// import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';
// import 'package:photofiy/features/home/domain/usecases/search_images_usecase.dart';

// class HomeController {
//   final SearchImagesUseCase searchImagesUseCase;
//   final PixabayRepository repository;

//   HomeController({
//     required this.searchImagesUseCase,
//     required this.repository,
//   });

//   // Value Notifiers for reactive UI
//   final ValueNotifier<List<PixabayImage>> _images = ValueNotifier([]);
//   final ValueNotifier<bool> _isLoading = ValueNotifier(false);
//   final ValueNotifier<String?> _errorMessage = ValueNotifier(null);
//   final ValueNotifier<bool> _hasReachedMax = ValueNotifier(false);
//   final ValueNotifier<int> _currentPage = ValueNotifier(1);
//   final ValueNotifier<bool> _showAppBar = ValueNotifier(true);

//   // Getters
//   ValueNotifier<List<PixabayImage>> get images => _images;
//   ValueNotifier<bool> get isLoading => _isLoading;
//   ValueNotifier<String?> get errorMessage => _errorMessage;
//   ValueNotifier<bool> get hasReachedMax => _hasReachedMax;
//   ValueNotifier<int> get currentPage => _currentPage;
//   ValueNotifier<bool> get showAppBar => _showAppBar;

//   // Scroll controller for the main list
//   final ScrollController scrollController = ScrollController();
//   double _lastScrollPosition = 0;

//   void init() {
//     scrollController.addListener(_onScroll);
//     loadInitialImages();
//   }

//   void dispose() {
//     scrollController.dispose();
//     _images.dispose();
//     _isLoading.dispose();
//     _errorMessage.dispose();
//     _hasReachedMax.dispose();
//     _currentPage.dispose();
//     _showAppBar.dispose();
//   }

//   void _onScroll() {
//     final currentScrollPosition = scrollController.offset;
//     final isScrollingDown = currentScrollPosition > _lastScrollPosition;
    
//     // Hide/show app bar based on scroll direction
//     if (isScrollingDown && _showAppBar.value && currentScrollPosition > 100) {
//       _showAppBar.value = false;
//     } else if (!isScrollingDown && !_showAppBar.value) {
//       _showAppBar.value = true;
//     }
    
//     _lastScrollPosition = currentScrollPosition;

//     // Load more images when reaching near bottom
//     if (scrollController.position.pixels >= 
//         scrollController.position.maxScrollExtent - 200) {
//       loadMoreImages();
//     }
//   }

//   Future<void> loadInitialImages() async {
//     if (_isLoading.value) return;
    
//     _isLoading.value = true;
//     _errorMessage.value = null;

//     final result = await searchImagesUseCase(
//       const SearchImagesParams(page: 1),
//     );

//     result.fold(
//       (failure) {
//         _errorMessage.value = failure.message;
//         _isLoading.value = false;
//       },
//       (newImages) {
//         _images.value = newImages;
//         _hasReachedMax.value = newImages.length < 20;
//         _currentPage.value = 1;
//         _isLoading.value = false;
//       },
//     );
//   }

//   Future<void> loadMoreImages() async {
//     if (_hasReachedMax.value || _isLoading.value) return;

//     final nextPage = _currentPage.value + 1;

//     final result = await searchImagesUseCase(
//       SearchImagesParams(page: nextPage),
//     );

//     result.fold(
//       (failure) => _errorMessage.value = failure.message,
//       (newImages) {
//         _images.value = [..._images.value, ...newImages];
//         _hasReachedMax.value = newImages.length < 20;
//         _currentPage.value = nextPage;
//       },
//     );
//   }

//   Future<void> refreshImages() async {
//     _currentPage.value = 1;
//     _hasReachedMax.value = false;
//     await loadInitialImages();
//   }

//   bool isFavorite(int imageId) {
//     return repository.isFavorite(imageId);
//   }
// }