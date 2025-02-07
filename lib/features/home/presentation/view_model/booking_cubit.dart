import 'package:bloc/bloc.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Future<void> fetchBookings() async {
    try {
      emit(BookingLoading());
      // Simulate fetching data from an API or database
      await Future.delayed(const Duration(seconds: 2));
      emit(BookingLoaded(["Booking 1", "Booking 2", "Booking 3"]));
    } catch (e) {
      emit(BookingError("Failed to load bookings"));
    }
  }
}
