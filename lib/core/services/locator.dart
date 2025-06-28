import 'package:get_it/get_it.dart';
import 'package:photofiy/core/services/connectivity.dart';
import 'package:photofiy/core/services/dio_factory.dart';
import 'package:photofiy/core/services/network_client.dart';
import 'package:photofiy/features/home/data/datasources/pixabay_remote_data_source.dart';
import 'package:photofiy/features/home/data/repositories/pixabay_repository_impl.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';
import 'package:photofiy/features/home/domain/usecases/favorite_usecase.dart';
import 'package:photofiy/features/home/domain/usecases/search_images_usecase.dart';
import 'package:photofiy/features/home/view/bloc/home_bloc.dart';

import '../../features/favorite/view/bloc/favorites_bloc.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  // Track the usage count of registered services
  static final Map<Type, int> _usageCount = {};

  // Increment usage count for a type
  static void _incrementUsage<T>() {
    _usageCount[T] = (_usageCount[T] ?? 0) + 1;
  }

  // Decrement usage count for a type
  static void release<T extends Object>() {
    if (_usageCount[T] != null) {
      _usageCount[T] = (_usageCount[T] ?? 1) - 1;
      // If usage count is 0, unregister the service
      if (_usageCount[T] == 0) {
        _getIt.unregister<T>();
        _usageCount.remove(T);
      }
    }
  }

  // Shorthand accessor for GetIt
  static T sl<T extends Object>() => _getIt<T>();

  // Register singletons
  static void setup() {
    _register<NetworkController>(NetworkController.instance);

    // Core services
    _registerLazySingleton(() => DioFactory.getDio());
    _registerLazySingleton(() => NetworkClient(sl()));

    // Data sources
    _registerLazySingleton<PixabayRemoteDataSource>(
      () => PixabayRemoteDataSourceImpl(sl()),
    );

    // Repositories
    _registerLazySingleton<PixabayRepository>(
      () => PixabayRepositoryImpl(sl()),
    );

    // Use cases
    _registerLazySingleton(() => SearchImagesUseCase(sl()));
    _registerLazySingleton(() => ToggleFavoriteUseCase(sl()));
    _registerLazySingleton(() => GetFavoriteImagesUseCase(sl()));

    // BLoCs
    _registerFactory(
      () => HomeBloc(
        searchImagesUseCase: sl(),
        toggleFavoriteUseCase: sl(),
        getFavoriteImagesUseCase: sl(),
        repository: sl(),
      ),
    );
    _registerFactory(
      () => FavoritesBloc(
        getFavoriteImagesUseCase: sl(),
        toggleFavoriteUseCase: sl(),
        repository: sl(),
      ),
    );
  }

  // Private method to register services and initialize usage count
  static void _register<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
    _usageCount[T] = 0; // Initialize usage count
  }

  // Register lazy singletons
  static void _registerLazySingleton<T extends Object>(T Function() factory) {
    _getIt.registerLazySingleton<T>(factory);
    _usageCount[T] = 0; // Initialize usage count
  }

  // Register factories
  static void _registerFactory<T extends Object>(T Function() factory) {
    _getIt.registerFactory<T>(factory);
    _usageCount[T] = 0; // Initialize usage count
  } // Accessor for NetworkController

  static NetworkController get networkController {
    _incrementUsage<NetworkController>();
    return _getIt<NetworkController>();
  }
}
