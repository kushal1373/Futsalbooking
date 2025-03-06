// import 'package:dartz/dartz.dart';
// import 'package:futsal_booking/core/error/failure.dart';
// import 'package:futsal_booking/features/home/data/model/booking_model.dart';

// abstract class IBookingRepository {
//   Future<Either<Failure, List<BookingModel>>> getBookings();
//   Future<Either<Failure, BookingModel>> createBooking(Map<String, dynamic> bookingData);
// }

import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';

abstract class IBookingRepository {
  Future<Either<Failure, List<BookingModel>>> getBookings();

  Future<Either<Failure, BookingModel>> createBooking(Map<String, dynamic> bookingData);
}
