import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/domain/entity/court_entity.dart';
import 'package:futsal_booking/features/home/domain/repository/dashboard_repository.dart';

class GetDashboardDataUseCase {
  final IDashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  Future<Either<Failure, List<CourtEntity>>> call() async {
    return repository.getCourts();
  }
}
