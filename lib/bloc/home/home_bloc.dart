import 'package:apple_online_shop/bloc/home/home_event.dart';
import 'package:apple_online_shop/bloc/home/home_state.dart';
import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/repository/banner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetInitializedDataEvent>(
      (event, emit) async {
        emit(HomeLoadingStateState());
        final bannerList = await _bannerRepository.getBanners();
        emit(HomeRequestSuccessState(bannerList));
      },
    );
  }
}
