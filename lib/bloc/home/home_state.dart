import 'package:apple_online_shop/data/model/banners.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingStateState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banners>> bannerList;
  HomeRequestSuccessState(this.bannerList);
}
