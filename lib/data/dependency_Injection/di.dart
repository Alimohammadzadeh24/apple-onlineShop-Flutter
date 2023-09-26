import 'package:apple_online_shop/data/data_source/authentication_datasource.dart';
import 'package:apple_online_shop/data/repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;
Future<void> getItInit() async {

  //components
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));
  
  locator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());



  //dataSource
  locator.registerFactory<IAuthenticationDataSourcec>(
    () => AuthenticationRemote(),
  );

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
