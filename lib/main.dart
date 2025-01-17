
import 'package:flutter/material.dart';
import 'package:futsal_booking/app/di/di.dart';
import 'package:futsal_booking/app/widget/app.dart';
import 'package:futsal_booking/core/network/hive_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
