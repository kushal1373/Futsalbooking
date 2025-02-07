import 'package:flutter_test/flutter_test.dart';
import 'package:futsal_booking/features/auth/domain/entity/auth_entity.dart';

void main() {
  group('AuthEntity Tests', () {
    const authEntity1 = AuthEntity(
      userId: '123',
      fName: 'Kushal',
      lName: 'Thapa',
      image: 'profile.jpg',
      phone: '1234567981',
      username: 'kushal@example.com',
      password: 'password777',
    );

    const authEntity2 = AuthEntity(
      userId: '123',
      fName: 'Kushal',
      lName: 'Thapa',
      image: 'profile.jpg',
      phone: '1234567981',
      username: 'kushal@example.com',
      password: 'password777',
    );

    const differentAuthEntity = AuthEntity(
      userId: '456',
      fName: 'John',
      lName: 'Doe',
      image: 'avatar.jpg',
      phone: '9876543210',
      username: 'john@example.com',
      password: 'securepass123',
    );

    test('should create an instance with correct properties', () {
      expect(authEntity1.userId, '123');
      expect(authEntity1.fName, 'Kushal');
      expect(authEntity1.lName, 'Thapa');
      expect(authEntity1.image, 'profile.jpg');
      expect(authEntity1.phone, '1234567981');
      expect(authEntity1.username, 'kushal@example.com');
      expect(authEntity1.password, 'password777');
    });

    test('should support value equality', () {
      expect(authEntity1, equals(authEntity2));
    });

    test('should be different for different property values', () {
      expect(authEntity1, isNot(equals(differentAuthEntity)));
    });

    test('should have correct props list', () {
      expect(authEntity1.props, [
        '123',
        'Kushal',
        'Thapa',
        'profile.jpg',
        '1234567981',
        'kushal@example.com',
        'password777'
      ]);
    });

    test('should allow nullable userId', () {
      const entity = AuthEntity(
        fName: 'Kushal',
        lName: 'Thapa',
        image: 'profile.jpg',
        phone: '1234567981',
        username: 'kushal@example.com',
        password: 'password777',
      );

      expect(entity.userId, isNull);
    });

    test('should allow nullable image', () {
      const entity = AuthEntity(
        userId: '123',
        fName: 'Kushal',
        lName: 'Thapa',
        phone: '1234567981',
        username: 'kushal@example.com',
        password: 'password777',
      );

      expect(entity.image, isNull);
    });

    test('should support different userId values', () {
      const entity1 = AuthEntity(
        userId: '111',
        fName: 'A',
        lName: 'B',
        phone: '999',
        username: 'a@b.com',
        password: 'pass',
      );
      const entity2 = AuthEntity(
        userId: '222',
        fName: 'A',
        lName: 'B',
        phone: '999',
        username: 'a@b.com',
        password: 'pass',
      );

      expect(entity1, isNot(equals(entity2)));
    });

    test('should allow missing optional fields without throwing error', () {
      expect(
        () => const AuthEntity(
          fName: 'Test',
          lName: 'User',
          phone: '9999999999',
          username: 'test@example.com',
          password: 'testpass',
        ),
        returnsNormally,
      );
    });

    test('should support copying an instance with different values', () {
      final updatedEntity = authEntity1.copyWith(
        fName: 'Updated',
        username: 'updated@example.com',
        password: 'newpassword',
      );

      expect(updatedEntity.userId, '123');
      expect(updatedEntity.fName, 'Updated');
      expect(updatedEntity.lName, 'Thapa');
      expect(updatedEntity.image, 'profile.jpg');
      expect(updatedEntity.phone, '1234567981');
      expect(updatedEntity.username, 'updated@example.com');
      expect(updatedEntity.password, 'newpassword');
    });

    test('should support partial updates using copyWith', () {
      final updatedEntity = authEntity1.copyWith(
        fName: 'Partial Update',
      );

      expect(updatedEntity.userId, '123');
      expect(updatedEntity.fName, 'Partial Update'); // Updated
      expect(updatedEntity.lName, 'Thapa'); // Unchanged
      expect(updatedEntity.image, 'profile.jpg'); // Unchanged
      expect(updatedEntity.phone, '1234567981'); // Unchanged
      expect(updatedEntity.username, 'kushal@example.com'); // Unchanged
      expect(updatedEntity.password, 'password777'); // Unchanged
    });

   
  });
}