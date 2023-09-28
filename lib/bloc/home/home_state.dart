import 'package:apple_online_shop/data/model/banner.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingStateState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banner>> bannerList;
  HomeRequestSuccessState(this.bannerList);
}
