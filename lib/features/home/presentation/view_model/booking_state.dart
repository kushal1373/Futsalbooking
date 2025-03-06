// import 'package:equatable/equatable.dart';

// abstract class BookingState extends Equatable {
//   const BookingState();

//   @override
//   List<Object> get props => [];
// }

// class BookingInitial extends BookingState {}

// class BookingLoading extends BookingState {}

// class BookingLoaded extends BookingState {
//   final List<String> bookings;
  
//   const BookingLoaded(this.bookings);

//   @override
//   List<Object> get props => [bookings];
// }

// class BookingError extends BookingState {
//   final String message;

//   const BookingError(this.message);

//   @override
//   List<Object> get props => [message];
// }


import 'package:equatable/equatable.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<BookingModel> bookings;

  const BookingLoaded({required this.bookings});

  @override
  List<Object> get props => [bookings];
}

class BookingError extends BookingState {
  final String message;

  const BookingError({required this.message});

  @override
  List<Object> get props => [message];
}
