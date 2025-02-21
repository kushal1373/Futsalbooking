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


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingLoading());

  final List<Booking> _bookings = []; // Stores all bookings

  /// Fetch stored bookings
  void fetchBookings() {
    emit(BookingLoaded(bookings: List.from(_bookings))); // Emit stored bookings
  }

  /// Add a new booking
  void addBooking(Booking booking) {
    _bookings.add(booking);
    emit(BookingLoaded(bookings: List.from(_bookings))); // Emit updated list
  }
}
