import 'package:dishcovery/ui/recipe/recipe_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/local_storage/storage_service.dart';
import '../data/local_storage/storage_service_implementation.dart';
import '../data/network/api_service.dart';
import '../data/repository/repository.dart';
import '../data/repository/repository_impl.dart';

GetIt serviceLocator = GetIt.asNewInstance();

void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<LocalPreferences>(() => LocalPreferencesImpl());
  serviceLocator.registerLazySingleton<Repository>(() => RepositoryImpl());
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
  serviceLocator.registerLazySingleton(() => RecipeBloc());
}
