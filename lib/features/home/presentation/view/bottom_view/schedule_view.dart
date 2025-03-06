// import 'package:flutter/material.dart';

// class ScheduleView extends StatelessWidget {
//   const ScheduleView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "Schedule Page Coming Soon!",
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<BookingCubit>().fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingLoaded) {
            final now = DateTime.now();

            final upcomingBookings = state.bookings.where((booking) {
              return booking.dateTime.isAfter(now);
            }).toList();

            final pastBookings = state.bookings.where((booking) {
              return booking.dateTime.isBefore(now);
            }).toList();

            return TabBarView(
              controller: _tabController,
              children: [
                _buildBookingList(upcomingBookings),
                _buildBookingList(pastBookings),
              ],
            );
          } else if (state is BookingError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildBookingList(List<BookingModel> bookings) {
    if (bookings.isEmpty) {
      return const Center(child: Text('No bookings found.'));
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return _buildBookingCard(booking);
      },
    );
  }

  Widget _buildBookingCard(BookingModel booking) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.sports_soccer, size: 36, color: Colors.green),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.courtName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(DateFormat('yyyy-MM-dd').format(booking.dateTime)),
                      const SizedBox(width: 8),
                      const Icon(Icons.access_time, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(booking.timeSlot),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.emoji_events, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
