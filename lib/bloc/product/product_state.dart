import 'package:apple_online_shop/data/model/product_image.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseSuccessState extends ProductState {
  final Either<String, List<Productimage>> getProductImgage;
  ProductResponseSuccessState(this.getProductImgage);
}
