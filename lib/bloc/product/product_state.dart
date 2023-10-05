import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:apple_online_shop/data/model/product_variant.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseSuccessState extends ProductState {
  final Either<String, List<Productimage>> productImgage;
  final Either<String, List<ProductVariant>> productVariant;
  ProductResponseSuccessState(
    this.productImgage,
    this.productVariant,
  );
}
