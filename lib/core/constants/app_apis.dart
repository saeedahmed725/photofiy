class AppApis {
  AppApis._();
  static const String baseUrl = 'https://pixabay.com/api/';
  
  // TODO: Get your free API key from: https://pixabay.com/api/docs/
  // For demo purposes, set to empty to show placeholder data
  static const String apiKey = '14031249-02bb0a3da7358704ceb65fa5b'; // Add your valid Pixabay API key here
  
  // Endpoints
  static const String images = '';
  static const String videos = 'videos/';
  
  // Default parameters
  static const int defaultPerPage = 20;
  static const String defaultImageType = 'photo';
  static const String defaultOrder = 'popular';
  static const String defaultOrientation = 'all';
  static const String defaultCategory = '';
  static const bool defaultSafeSearch = true;
  
  // Demo mode flag
  static bool get isDemoMode => apiKey.isEmpty;
}
