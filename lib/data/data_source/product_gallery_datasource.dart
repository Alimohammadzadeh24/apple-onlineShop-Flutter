import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/errors/api_exception.dart';
import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:dio/dio.dart';

abstract class IProductGalleryDatasource {
  Future<List<Productimage>> getGallery();
}

class ProductGalleryRemote implements IProductGalleryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Productimage>> getGallery() async {
    try {
      Map<String, String> qParams = {
        'filter':'product_id="x3lprgo7ejmx8yj"'
      };
      final response = await _dio.get('collections/gallery/records' , queryParameters: qParams);
      return response.data['items']
          .map<Productimage>((jsonObject) => Productimage.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطایی دیگر');
    }
  }
}
