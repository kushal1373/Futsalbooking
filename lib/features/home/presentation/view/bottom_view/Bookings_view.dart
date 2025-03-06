//this is working correctly
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/domain/entity/court_entity.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_cubit.dart';
import 'package:futsal_booking/features/home/presentation/view_model/booking_state.dart';
import 'package:intl/intl.dart';

class BookingView extends StatefulWidget {
  final CourtEntity court;
  final String userId;

  const BookingView({super.key, required this.court, required this.userId});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  DateTime? selectedDate;
  String? selectedTimeSlot;

  final List<String> timeSlots = [
    '6:00 - 7:00am',
    '7:00 - 8:00am',
    '8:00 - 9:00am',
    '9:00 - 10:00am',
    '10:00 - 11:00am',
    '11:00 - 12:00pm',
    '12:00 - 1:00pm',
    '1:00 - 2:00pm',
    '2:00 - 3:00pm',
    '3:00 - 4:00pm',
    '4:00 - 5:00pm',
    '5:00 - 6:00pm',
    '6:00 - 7:00pm',
    '7:00 - 8:00pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book ${widget.court.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text(selectedDate == null
                  ? 'Pick Date'
                  : DateFormat('yyyy-MM-dd').format(selectedDate!)),
            ),
            DropdownButton<String>(
              value: selectedTimeSlot,
              hint: const Text('Select Time Slot'),
              isExpanded: true,
              items: timeSlots.map((slot) {
                return DropdownMenuItem(
                  value: slot,
                  child: Text(slot),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedTimeSlot = value),
            ),
            const Spacer(),
            BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) {
                if (state is BookingError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is BookingLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Booking Successful!')));
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: _confirmBooking,
                  child: state is BookingLoading
                      ? const CircularProgressIndicator()
                      : const Text('Confirm Booking'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  void _confirmBooking() {
    if (selectedDate == null || selectedTimeSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select date and time slot')));
      return;
    }

    context.read<BookingCubit>().addBooking({
      'courtName': widget.court.name,
      'dateTime': selectedDate!.toIso8601String(),
      'timeSlot': selectedTimeSlot,
      'userId': widget.userId,
    });
  }
}
