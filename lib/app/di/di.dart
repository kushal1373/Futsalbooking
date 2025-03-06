import 'package:dio/dio.dart';
import 'package:futsal_booking/app/shared_prefs/token_shared_prefs.dart';
import 'package:futsal_booking/core/network/api_service.dart';
import 'package:futsal_booking/core/network/hive_service.dart';
import 'package:futsal_booking/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:futsal_booking/features/auth/data/data_source/local_data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:futsal_booking/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:futsal_booking/features/auth/data/repository/auth_remote_repository.dart';
import 'package:futsal_booking/features/auth/domain/use_case/login_usecase.dart';
import 'package:futsal_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:futsal_booking/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:futsal_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:futsal_booking/features/home/data/data_source/booking_remote_datasource.dart';
import 'package:futsal_booking/features/home/data/data_source/dashboard_remote_datasource.dart';
import 'package:futsal_booking/features/home/data/repository/booking_repository_impl.dart';
import 'package:futsal_booking/features/home/data/repository/dashboard_repository_impl.dart';
import 'package:futsal_booking/features/home/domain/repository/booking_repository.dart';
import 'package:futsal_booking/features/home/domain/repository/dashboard_repository.dart';
import 'package:futsal_booking/features/home/domain/use_case/create_booking_usecase.dart';
import 'package:futsal_booking/features/home/domain/use_case/get_bookings_usecase.dart';
import 'package:futsal_booking/features/home/domain/use_case/get_dashboarddata_usecase.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:futsal_booking/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize Hive, API, and Shared Preferences first
  _initHiveService();
  _initApiService();
  await _initSharedPreferences();

  // Initialize dependencies for Home, Register, Login, and Splash
  _initHomeDependencies();
  _initRegisterDependencies();
  _initLoginDependencies();
  _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void _initApiService() {
  // Register a Dio instance using your ApiService wrapper
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

void _initRegisterDependencies() {
  // --------------------- Auth Dependencies ---------------------
  // Local Data Source
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );
  // Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );
  // Booking Remote Data Source
  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSource(getIt<Dio>()),
  );
  // --------------------- Booking Repository & Use Cases ---------------------
  getIt.registerLazySingleton<IBookingRepository>(
    () => BookingRepositoryImpl(getIt<BookingRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetBookingsUseCase>(
    () => GetBookingsUseCase(getIt<IBookingRepository>()),
  );
  getIt.registerLazySingleton<CreateBookingUseCase>(
    () => CreateBookingUseCase(getIt<IBookingRepository>()),
  );
  // Register BookingCubit (we use factory so a new instance is created on each request)
  getIt.registerFactory(() => BookingCubit(
        getIt<GetBookingsUseCase>(),
        getIt<CreateBookingUseCase>(),
        // Add the missing argument here
      ));
  // --------------------- Auth Repositories and Use Cases ---------------------
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );
  // --------------------- Dashboard Dependencies ---------------------
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<IDashboardRepository>(
    () => DashboardRepositoryImpl(getIt<DashboardRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetDashboardDataUseCase>(
    () => GetDashboardDataUseCase(getIt<IDashboardRepository>()),
  );
  // --------------------- Other Use Cases ---------------------
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(getIt<AuthRemoteRepository>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      uploadImageUsecase: getIt<UploadImageUsecase>(),
      registerUseCase: getIt<RegisterUseCase>(),
    ),
  );
}

void _initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

void _initLoginDependencies() async {
  // --------------------- Token Shared Preferences ---------------------
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
  // --------------------- Login Use Cases ---------------------
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

void _initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
);
}