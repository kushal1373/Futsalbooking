import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'auth_repo.mock.dart';

class MockFile extends Mock implements File {}

void main() {
  late AuthRepoMock repository;
  late UploadImageUsecase usecase;
  late MockFile file;

  setUpAll(() {
    registerFallbackValue(MockFile());
  });

  setUp(() {
    repository = AuthRepoMock();
    usecase = UploadImageUsecase(repository);
    file = MockFile();
  });

  group('UploadImageUsecase Tests', () {
    test('should upload profile picture successfully', () async {
      when(() => repository.uploadProfilePicture(any<File>()))
          .thenAnswer((_) async => const Right('Image uploaded successfully'));

      final result = await usecase(UploadImageParams(file: file));
      
      expect(result, const Right('Image uploaded successfully'));
      verify(() => repository.uploadProfilePicture(any<File>())).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return ApiFailure when image upload fails', () async {
      final failure = ApiFailure(message: "Image upload failed");

      when(() => repository.uploadProfilePicture(any<File>()))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(UploadImageParams(file: file));

      expect(result, Left(failure));
      verify(() => repository.uploadProfilePicture(any<File>())).called(1);
      verifyNoMoreInteractions(repository);
    });
  });

  tearDown(() {
    repository = AuthRepoMock();
  });
}
