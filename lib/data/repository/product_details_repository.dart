import 'package:apple_online_shop/data/data_source/product_details_datasource.dart';
import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/errors/api_exception.dart';
import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:apple_online_shop/data/model/product_variant.dart';
import 'package:apple_online_shop/data/model/variant.dart';
import 'package:apple_online_shop/data/model/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailsRepository {
  Future<Either<String, List<Productimage>>> getGallery(String productId);
  Future<Either<String, List<VariantType>>> getVariantTypes();
  Future<Either<String, List<Variant>>> getVariant();
  Future<Either<String, List<ProductVariant>>> getProductVariant();
}

class ProductDetailsRepository implements IProductDetailsRepository {
  final IProductDetailsDatasource _dataSource = locator.get();
  @override
  Future<Either<String, List<Productimage>>> getGallery(
      String productId) async {
    try {
      final response = await _dataSource.getGallery(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای گالری بدون متن');
    }
  }
  
  @override
  Future<Either<String, List<VariantType>>> getVariantTypes () async {
    try {
      final response = await _dataSource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای variantType بدون متن');
    }
  }
  
  @override
  Future<Either<String, List<Variant>>> getVariant() async {
    try {
      final response = await _dataSource.getVariant();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای Variant بدون متن');
    }
  }
  
  @override
  Future<Either<String, List<ProductVariant>>> getProductVariant() async {
    try {
      final response = await _dataSource.getProductVariant();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای ProductVariant بدون متن');
    }
  }
}
