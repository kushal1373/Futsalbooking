import 'package:dartz/dartz.dart';
import 'package:futsal_booking/core/error/failure.dart';
import 'package:futsal_booking/features/home/domain/entity/court_entity.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, List<CourtEntity>>> getCourts();
}
