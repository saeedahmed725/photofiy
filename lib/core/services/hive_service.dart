import 'package:hive_flutter/hive_flutter.dart';
import 'package:photofiy/features/home/data/models/pixabay_image_model.dart';

class HiveService {
  static const String _favoriteImagesBox = 'favorite_images';
  static const String _searchHistoryBox = 'search_history';

  static late Box<PixabayImageModel> _favoriteBox;
  static late Box<String> _searchBox;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PixabayImageModelAdapter());
    }
    
    // Open boxes
    _favoriteBox = await Hive.openBox<PixabayImageModel>(_favoriteImagesBox);
    _searchBox = await Hive.openBox<String>(_searchHistoryBox);
  }
  // Favorite Images Operations
  static Future<void> addToFavorites(PixabayImageModel image) async {
    if (!Hive.isBoxOpen(_favoriteImagesBox)) return;
    await _favoriteBox.put(image.id.toString(), image);
  }

  static Future<void> removeFromFavorites(int imageId) async {
    if (!Hive.isBoxOpen(_favoriteImagesBox)) return;
    await _favoriteBox.delete(imageId.toString());
  }
  static bool isFavorite(int imageId) {
    if (!Hive.isBoxOpen(_favoriteImagesBox)) return false;
    return _favoriteBox.containsKey(imageId.toString());
  }

  static List<PixabayImageModel> getFavoriteImages() {
    if (!Hive.isBoxOpen(_favoriteImagesBox)) return [];
    return _favoriteBox.values.toList();
  }
  static Stream<BoxEvent> watchFavorites() {
    if (!Hive.isBoxOpen(_favoriteImagesBox)) {
      return const Stream.empty();
    }
    return _favoriteBox.watch();
  }
  // Search History Operations
  static Future<void> addSearchQuery(String query) async {
    if (query.trim().isEmpty) return;
    if (!Hive.isBoxOpen(_searchHistoryBox)) return;
    
    // Remove if exists to avoid duplicates
    final existingKeys = _searchBox.keys.where((key) => 
        _searchBox.get(key) == query).toList();
    
    for (var key in existingKeys) {
      await _searchBox.delete(key);
    }
    
    // Add to beginning
    await _searchBox.add(query);
    
    // Keep only last 10 searches
    if (_searchBox.length > 10) {
      final keysToDelete = _searchBox.keys.take(_searchBox.length - 10);
      for (var key in keysToDelete) {
        await _searchBox.delete(key);
      }
    }
  }
  static List<String> getSearchHistory() {
    if (!Hive.isBoxOpen(_searchHistoryBox)) return [];
    return _searchBox.values.toList().reversed.toList();
  }
  static Future<void> clearSearchHistory() async {
    if (!Hive.isBoxOpen(_searchHistoryBox)) return;
    await _searchBox.clear();
  }

  // Close boxes (call on app disposal)
  static Future<void> dispose() async {
    await _favoriteBox.close();
    await _searchBox.close();
  }
}
