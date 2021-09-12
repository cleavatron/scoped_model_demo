import 'package:get_it/get_it.dart';
import 'package:scoped_model_demo/scoped_model/error_model.dart';
import 'package:scoped_model_demo/scoped_model/home_model.dart';
import 'package:scoped_model_demo/scoped_model/success_model.dart';
import 'package:scoped_model_demo/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<StorageService>(() => StorageService());

  // Register models
  locator.registerFactory<HomeModel>(() => HomeModel());
  locator.registerFactory<SuccessModel>(() => SuccessModel());
  locator.registerFactory<ErrorModel>(() => ErrorModel());
}
