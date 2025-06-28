import 'package:dio/dio.dart';
import 'package:photofiy/core/constants/app_apis.dart';
import 'package:photofiy/core/services/network_client.dart';
import 'package:photofiy/features/home/data/models/pixabay_response_model.dart';

abstract class PixabayRemoteDataSource {
  Future<PixabayResponseModel> searchImages({
    String? query,
    String imageType = AppApis.defaultImageType,
    String orientation = AppApis.defaultOrientation,
    String category = AppApis.defaultCategory,
    String order = AppApis.defaultOrder,
    bool safeSearch = AppApis.defaultSafeSearch,
    int page = 1,
    int perPage = AppApis.defaultPerPage,
  });
}

class PixabayRemoteDataSourceImpl implements PixabayRemoteDataSource {
  final NetworkClient networkClient;

  PixabayRemoteDataSourceImpl(this.networkClient);

  @override
  Future<PixabayResponseModel> searchImages({
    String? query,
    String imageType = AppApis.defaultImageType,
    String orientation = AppApis.defaultOrientation,
    String category = AppApis.defaultCategory,
    String order = AppApis.defaultOrder,
    bool safeSearch = AppApis.defaultSafeSearch,
    int page = 1,
    int perPage = AppApis.defaultPerPage,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'key': AppApis.apiKey,
      'image_type': imageType,
      'orientation': orientation,
      'order': order,
      'safesearch': safeSearch.toString(),
      'page': page,
      'per_page': perPage,
    };

    if (query != null && query.isNotEmpty) {
      queryParameters['q'] = query;
    }

    if (category.isNotEmpty) {
      queryParameters['category'] = category;
    }

    final Response response = await networkClient.get(
      AppApis.baseUrl + AppApis.images,
      queryParameters: queryParameters,
    );

    return PixabayResponseModel.fromJson(response.data);
  }
}
