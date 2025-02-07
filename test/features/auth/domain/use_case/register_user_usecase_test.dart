
import 'package:flutter_test/flutter_test.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';
import 'package:futsal_booking/features/auth/domain/repository/auth_repository.dart';
import 'package:futsal_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';



// Mock repository class
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository repository;
  late RegisterUseCase usecase;

  // Setup before each test
  setUp(() {
    repository = MockAuthRepository();
    usecase = RegisterUseCase(repository);
    // Register a fallback value for any AuthEntity mock
    registerFallbackValue(const AuthEntity(
    userId: "",
    fName: "",
    lName: "",
    image: " ",
    phone: " ",
    username: "",
    password: "",
    ));
  });

  // Define sample RegisterUserParams for tests
  const params = RegisterUserParams(
   
    fname: "kushal",
    lname: "thapa",
    image: " image",
    phone: " 22222222",
    username: "kushalthapa",
    password: "1111111",
  );

  // Test case 1: Should register user successfully
  test('should register user successfully', () async {
    // Arrange
    when(() => repository.registerCustomer(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(null));
    verify(() => repository.registerCustomer(any())).called(1);
    verifyNoMoreInteractions(repository);
  });

  // Test case 2: Should return ApiFailure when registration fails
  test('should return ApiFailure when user registration fails', () async {
    // Arrange
    final failure = ApiFailure(message: "Registration failed");
    when(() => repository.registerCustomer(any())).thenAnswer(
      (_) async => Left(failure),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, Left(failure));
    verify(() => repository.registerCustomer(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}