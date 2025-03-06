// class CourtEntity {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final String? location;

//   CourtEntity({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     this.location,
//   });
// }


class CourtEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String? location;
  final List<String> bookedTimeSlots; // New property

  CourtEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.location,
    this.bookedTimeSlots = const [], // Default to an empty list
  });
}
