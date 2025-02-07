import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:futsal_booking/app/usecase/usecase.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';
import 'package:futsal_booking/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  final String phone;
  final String username;
  final String password;
  final String? image;

  const RegisterUserParams(
      {required this.fname,
      required this.lname,
      required this.phone,
      required this.username,
      required this.password,
      this.image});

  //intial constructor
  const RegisterUserParams.initial(
      {required this.fname,
      required this.lname,
      required this.phone,
      required this.username,
      required this.password,
      this.image});

  @override
  List<Object?> get props => [fname, lname, phone, username, image, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    print("usecase ko image ${params.image}");
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      image: params.image,
      phone: params.phone,
      username: params.username,
      password: params.password,
    );
    return repository.registerCustomer(authEntity);
  }
}