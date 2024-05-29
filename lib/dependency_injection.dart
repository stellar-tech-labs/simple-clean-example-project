import 'package:get_api/src/posts/data/datasources/post_remote_datasources.dart';
import 'package:get_api/src/posts/data/repository_impl/post_repo_impl.dart';
import 'package:get_api/src/posts/domain/repository/post_repository.dart';
import 'package:get_api/src/posts/domain/usecases/post_usecase.dart';
import 'package:get_api/src/posts/presentation/cubits/post_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; //sl--> Service Locator

void initGetIt() {
  //datasources
  datasources();
  //repositories
  repositories();
  //usecases
  usecases();
  //cubits
  cubits();
}

void datasources() {
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl());
}

void repositories() {
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));
}

void usecases() {
  sl.registerLazySingleton<PostUsecase>(() => PostUsecase(sl()));
}

void cubits() {
  sl.registerLazySingleton<PostCubit>(() => PostCubit(sl()));
}
