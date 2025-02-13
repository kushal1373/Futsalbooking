
import 'package:futsal_booking/core/network/hive_service.dart';
import 'package:futsal_booking/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:futsal_booking/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:futsal_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:futsal_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:futsal_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:futsal_booking/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
