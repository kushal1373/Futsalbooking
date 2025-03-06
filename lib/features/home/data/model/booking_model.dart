class BookingModel {
  final String courtName;
  final DateTime dateTime;
  final String timeSlot;
  
  // Optionally, if you need to determine if a booking is past:
  bool get isPast => dateTime.isBefore(DateTime.now());

  BookingModel({
    required this.courtName,
    required this.dateTime,
    required this.timeSlot,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      courtName: json['courtName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      timeSlot: json['timeSlot'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courtName': courtName,
      'dateTime': dateTime.toIso8601String(),
      'timeSlot': timeSlot,
    };
  }
}
