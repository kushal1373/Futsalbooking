import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';
import 'package:futsal_booking/features/home/domain/repository/booking_repository.dart';

class GetBookingsUseCase {
  final IBookingRepository repository;

  GetBookingsUseCase(this.repository);

  Future<Either<Failure, List<BookingModel>>> call() async {
    return repository.getBookings();
  }
}
