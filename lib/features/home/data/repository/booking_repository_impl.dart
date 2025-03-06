import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/data/data_source/booking_remote_datasource.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';
import 'package:futsal_booking/features/home/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements IBookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BookingModel>>> getBookings() async {
    try {
      final bookings = await remoteDataSource.fetchBookings();
      return Right(bookings);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingModel>> createBooking(Map<String, dynamic> bookingData) async {
    try {
      final booking = await remoteDataSource.createBooking(bookingData);
      return Right(booking);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

