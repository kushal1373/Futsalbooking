import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';
abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerCustomer(AuthEntity customer);

  Future<Either<Failure, String>> loginCustomer(
      String username, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
