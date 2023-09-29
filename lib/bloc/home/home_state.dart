import 'package:apple_online_shop/data/model/banners.dart';
import 'package:apple_online_shop/data/model/category.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banners>> bannerList;
  Either<String, List<Category>> categoryList;
  HomeRequestSuccessState(this.bannerList, this.categoryList);
}
