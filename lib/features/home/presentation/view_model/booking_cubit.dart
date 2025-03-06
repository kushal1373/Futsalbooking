// import 'package:bloc/bloc.dart';
// import 'booking_state.dart';

// class BookingCubit extends Cubit<BookingState> {
//   BookingCubit() : super(BookingInitial());

//   Future<void> fetchBookings() async {
//     try {
//       emit(BookingLoading());
//       // Simulate fetching data from an API or database
//       await Future.delayed(const Duration(seconds: 2));
//       emit(BookingLoaded(["Booking 1", "Booking 2", "Booking 3"]));
//     } catch (e) {
//       emit(BookingError("Failed to load bookings"));
//     }
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/home/data/model/booking_model.dart';
// import 'package:futsal_booking/features/home/domain/use_case/create_booking_usecase.dart';
// import 'package:futsal_booking/features/home/domain/use_case/get_bookings_usecase.dart';
// import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';

// class BookingCubit extends Cubit<BookingState> {
//   final GetBookingsUseCase getBookingsUseCase;
//   final CreateBookingUseCase createBookingUseCase;

//   BookingCubit(this.getBookingsUseCase, this.createBookingUseCase)
//       : super(BookingInitial());

//   Future<void> fetchBookings() async {
//     emit(BookingLoading());
//     final result = await getBookingsUseCase();
//     result.fold(
//       (failure) => emit(BookingError(message: failure.message)),
//       (bookings) => emit(BookingLoaded(bookings: bookings)),
//     );
//   }

//   Future<void> addBooking(Map<String, dynamic> bookingData) async {
//     final result = await createBookingUseCase(bookingData);
//     result.fold(
//       (failure) => emit(BookingError(message: failure.message)),
//       (booking) {
//         // Optionally, update state with the new booking or simply re-fetch bookings.
//         fetchBookings();
//       },
//     );
//   }
// }



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/domain/use_case/create_booking_usecase.dart';
import 'package:futsal_booking/features/home/domain/use_case/get_bookings_usecase.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetBookingsUseCase getBookingsUseCase;
  final CreateBookingUseCase createBookingUseCase;

  BookingCubit(this.getBookingsUseCase, this.createBookingUseCase) : super(BookingInitial());

  Future<void> fetchBookings() async {
    emit(BookingLoading());
    final result = await getBookingsUseCase();
    result.fold(
      (failure) => emit(BookingError(message: failure.message)),
      (bookings) => emit(BookingLoaded(bookings: bookings)),
    );
  }

  Future<void> addBooking(Map<String, dynamic> bookingData) async {
    emit(BookingLoading());
    final result = await createBookingUseCase(bookingData);
    result.fold(
      (failure) => emit(BookingError(message: failure.message)),
      (_) => fetchBookings(),
    );
  }
}
