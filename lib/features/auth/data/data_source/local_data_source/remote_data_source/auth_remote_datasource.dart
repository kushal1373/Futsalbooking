import 'dart:io';

import 'package:dio/dio.dart';
import 'package:futsal_booking/app/constants/api_endpoints.dart';
import 'package:futsal_booking/features/auth/data/data_source/local_data_source/auth_data_source.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);


@override
Future<AuthEntity> getCurrentUser() async {
  try {
    final response = await _dio.get(ApiEndpoints.getCurrentUser);
    if (response.statusCode == 200) {
      final data = response.data;
      return AuthEntity(
        fName: data['firstName'],
        lName: data['lastName'],
        phone: data['phone'] ?? '',    // or handle phone as needed
        username: data['username'],
        password: '', // Usually don't store or return raw passwords
        image: data['image'],
      );
    } else {
      throw Exception(response.statusMessage);
    }
  } on DioException catch (e) {
    throw Exception(e);
  } catch (e) {
    throw Exception(e);
  }
}


  
  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'file': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        // Extract the image name from the response
        final str = response.data['data'];

        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> loginStudent(String username, String password) async{
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> registerStudent(AuthEntity student) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": student.fName,
          "lastName": student.lName,
          "PhoneNumber": student.phone,
          "image": student.image,
          "username": student.username,
          "password": student.password,
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
