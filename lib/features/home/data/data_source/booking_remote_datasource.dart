// import 'package:dio/dio.dart';
// import 'package:futsal_booking/features/home/data/model/booking_model.dart';

// class BookingRemoteDataSource {
//   final Dio dio;

//   BookingRemoteDataSource(this.dio);

//   // GET request to fetch bookings
//   Future<List<BookingModel>> fetchBookings() async {
//     final response = await dio.get('http://10.0.2.2:3000/api/booking');
//     if (response.statusCode == 200) {
//       // Assuming the response JSON is like: { "bookings": [ { ... }, ... ] }
//       final List data = response.data['bookings'];
//       return data.map((json) => BookingModel.fromJson(json)).toList();
//     } else {
//       throw Exception(response.statusMessage);
//     }
//   }

//   // POST request to create a new booking
//   Future<BookingModel> createBooking(Map<String, dynamic> bookingData) async {
//     final response = await dio.post('http://10.0.2.2:3000/api/booking', data: bookingData);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return BookingModel.fromJson(response.data);
//     } else {
//       throw Exception(response.statusMessage);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:futsal_booking/features/home/data/model/booking_model.dart';

class BookingRemoteDataSource {
  final Dio dio;

  BookingRemoteDataSource(this.dio);

  Future<List<BookingModel>> fetchBookings() async {
    try {
      final response = await dio.get('http://10.0.2.2:3000/api/booking');
      print('Fetched bookings response: ${response.data}');
      if (response.statusCode == 200) {
        final List data = response.data['bookings'];
        return data.map((json) => BookingModel.fromJson(json)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      if (e is DioException) {
        print('DioError message: ${e.message}');
        print('DioError response: ${e.response?.data}');
      }
      throw Exception(e.toString());
    }
  }

  Future<BookingModel> createBooking(Map<String, dynamic> bookingData) async {
    final response = await dio.post('http://10.0.2.2:3000/api/booking', data: bookingData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return BookingModel.fromJson(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
