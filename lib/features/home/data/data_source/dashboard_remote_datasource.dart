import 'package:dio/dio.dart';
import 'package:futsal_booking/features/home/data/model/court_model.dart'; // Add this import

class DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSource(this.dio);

  Future<List<CourtModel>> fetchCourts() async {
    final response = await dio.get('http://10.0.2.2:3000/api/dashboard');
    if (response.statusCode == 200) {
      final rawData = response.data['courts']; // This should be a List now
      if (rawData == null) {
        // Either return an empty list or throw an exception
        return [];
      }
      final List data = rawData as List;
      return data.map((json) => CourtModel.fromJson(json)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
