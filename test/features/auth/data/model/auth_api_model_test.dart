import 'package:flutter_test/flutter_test.dart';
import 'package:futsal_booking/features/auth/data/model/auth_api_model.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';

void main() {
  group('AuthApiModel Tests', () {
    final json = {
      '_id': '123',
      'firstName': 'kushal',
      'lastName': 'thapa',
      'username': 'kushal@example.com',
      'PhoneNumber': '1234567981',
      'password': 'password777',
      'image': 'profile.jpg',
    };

    test('should convert from JSON correctly', () {
      final model = AuthApiModel.fromJson(json);

      expect(model.id, '123');
      expect(model.firstName, 'kushal');
      expect(model.lastName, 'thapa');
      expect(model.username, 'kushal@example.com');
      expect(model.PhoneNumber, '1234567981');
      expect(model.password, 'password777');
      expect(model.image, 'profile.jpg');
    });

    test('should convert to JSON correctly', () {
      final model = AuthApiModel.fromJson(json);
      final convertedJson = model.toJson();

      expect(convertedJson['_id'], '123');
      expect(convertedJson['firstName'], 'kushal');
      expect(convertedJson['lastName'], 'thapa');

      expect(convertedJson['userName'], 'kushal@example.com');
    });

    test('should convert between Entity and Model correctly', () {
      const entity = AuthEntity(
        userId: '123',
        username: 'kushal@example.com',
        fName: 'kushal',
        lName: 'thapa',
        password: 'password777',
        phone: '1234567981',
        image: 'profile.jpg',
      );

      final model = AuthApiModel.fromEntity(entity);
      final convertedEntity = model.toEntity();

      expect(convertedEntity, equals(entity));
    });
  });
}
