// import 'package:flutter/material.dart';
// import 'package:futsal_booking/app/di/di.dart';
// import 'package:futsal_booking/app/widget/app.dart';
// import 'package:futsal_booking/core/network/hive_service.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Initialize Hive Database
//   await HiveService.init();

//   // Initialize Dependencies

//   // await HiveService().clearStudentBox();

//   await initDependencies();

//   runApp(
    
//     App(),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/app/di/di.dart';
import 'package:futsal_booking/app/widget/app.dart';
import 'package:futsal_booking/core/network/hive_service.dart';
import 'package:futsal_booking/features/home/domain/use_case/get_dashboarddata_usecase.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/dashboard_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive Database
  await HiveService.init();

  // Initialize dependencies via GetIt
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        // Provide BookingCubit using DI
        BlocProvider<BookingCubit>(
          create: (context) => getIt<BookingCubit>(),
        ),
        // Provide DashboardCubit using DI
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(
            getIt<GetDashboardDataUseCase>(),
          ),
        ),
      ],
      child: App(),
    ),
  );
}
