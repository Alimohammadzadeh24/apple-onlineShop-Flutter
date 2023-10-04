import 'package:apple_online_shop/data/data_source/product_gallery_datasource.dart';
import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/errors/api_exception.dart';
import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:dartz/dartz.dart';

abstract class IProductGalleryRepository {
  Future<Either<String, List<Productimage>>> getGallery(String productId);
}

class ProductGalleryRepository implements IProductGalleryRepository {
  final IProductGalleryDatasource _dataSource = locator.get();
  @override
  Future<Either<String, List<Productimage>>> getGallery(
      String productId) async {
    try {
      final response = await _dataSource.getGallery(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'متنی ندارد');
    }
  }
}
