import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit()..fetchBookings(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Bookings"),
          backgroundColor: Colors.deepPurple,
        ),
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingLoaded) {
              return state.bookings.isEmpty
                  ? const Center(child: Text("No bookings yet."))
                  : ListView.builder(
                      itemCount: state.bookings.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.bookings[index]),
                          leading: const Icon(Icons.sports_soccer, color: Colors.deepPurple),
                        );
                      },
                    );
            } else if (state is BookingError) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else {
              return const Center(child: Text("Something went wrong!"));
            }
          },
        ),
      ),
    );
  }
}