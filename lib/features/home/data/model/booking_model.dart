class Booking {
  final String courtName;
  final DateTime dateTime;
  final String timeSlot;

  Booking({required this.courtName, required this.dateTime, required this.timeSlot});

  /// Determines if the booking is in the past
  bool get isPast => dateTime.isBefore(DateTime.now());

  /// Formats the date
  String get formattedDate => "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}
