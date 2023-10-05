import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/errors/api_exception.dart';
import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:apple_online_shop/data/model/product_variant.dart';
import 'package:apple_online_shop/data/model/variant.dart';
import 'package:apple_online_shop/data/model/variant_type.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailsDatasource {
  Future<List<Productimage>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVariant>> getProductVariant();
}

class ProductDetailsRemote implements IProductDetailsDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Productimage>> getGallery(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      final response = await _dio.get(
        'collections/gallery/records',
        queryParameters: qParams,
      );
      return response.data['items']
          .map<Productimage>(
              (jsonObject) => Productimage.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطایی دیگر');
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      final response = await _dio.get('collections/variants_type/records');
      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطایی دیگر');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      final response = await _dio.get('collections/variants/records');
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطایی دیگر');
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariant() async {
    final variantTypeList = await getVariantTypes();
    final variantList = await getVariant();

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      final variant = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantList.add(ProductVariant(variantType, variant));
    }
    return productVariantList;
  }
}
