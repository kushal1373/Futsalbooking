// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
// import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';

// class BookingsView extends StatelessWidget {
//   const BookingsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BookingCubit()..fetchBookings(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("My Bookings"),
//           backgroundColor: Colors.deepPurple,
//         ),
//         body: BlocBuilder<BookingCubit, BookingState>(
//           builder: (context, state) {
//             if (state is BookingLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is BookingLoaded) {
//               return state.bookings.isEmpty
//                   ? const Center(child: Text("No bookings yet."))
//                   : ListView.builder(
//                       itemCount: state.bookings.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(state.bookings[index]),
//                           leading: const Icon(Icons.sports_soccer, color: Colors.deepPurple),
//                         );
//                       },
//                     );
//             } else if (state is BookingError) {
//               return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
//             } else {
//               return const Center(child: Text("Something went wrong!"));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';

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
              final pastBookings = state.bookings.where((b) => b.isPast).toList();
              final upcomingBookings = state.bookings.where((b) => !b.isPast).toList();

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (upcomingBookings.isNotEmpty) ...[
                    const Text("Upcoming Bookings",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...upcomingBookings.map((booking) => _buildBookingTile(booking, Colors.green)),
                  ],
                  if (pastBookings.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text("Past Bookings",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...pastBookings.map((booking) => _buildBookingTile(booking, Colors.red)),
                  ],
                  if (state.bookings.isEmpty) 
                    const Center(child: Text("No bookings yet.")),
                ],
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

  Widget _buildBookingTile(Booking booking, Color iconColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.sports_soccer, color: iconColor),
        title: Text(booking.courtName),
        subtitle: Text("Date: ${booking.formattedDate} • Time: ${booking.timeSlot}"),
        trailing: booking.isPast
            ? const Icon(Icons.history, color: Colors.grey)
            : const Icon(Icons.upcoming, color: Colors.blue),
      ),
    );
  }
}
