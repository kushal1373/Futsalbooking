// import 'package:dartz/dartz.dart';
// import 'package:futsal_booking/core/error/failure.dart';
// import 'package:futsal_booking/features/home/data/model/booking_model.dart';
// import 'package:futsal_booking/features/home/domain/repository/booking_repository.dart';

// class CreateBookingUseCase {
//   final IBookingRepository repository;

//   CreateBookingUseCase(this.repository);

//   Future<Either<Failure, BookingModel>> call(
//       Map<String, dynamic> bookingData) async {
//     return repository.createBooking(bookingData);
 
//     }
//   }


import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';
import 'package:futsal_booking/features/home/domain/repository/booking_repository.dart';

class CreateBookingUseCase {
  final IBookingRepository repository;

  CreateBookingUseCase(this.repository);

  Future<Either<Failure, BookingModel>> call(
      Map<String, dynamic> bookingData) async {
    return repository.createBooking(bookingData);
  }
}
