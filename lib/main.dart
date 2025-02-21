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
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BookingCubit()), // Make BookingCubit globally available
      ],
      child: App(),
    ),
  );
}
