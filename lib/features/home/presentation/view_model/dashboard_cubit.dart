import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/domain/entity/court_entity.dart';
import 'package:futsal_booking/features/home/domain/use_case/get_dashboarddata_usecase.dart';

// Remove any duplicate or incorrect imports

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<CourtEntity> courts;
  DashboardLoaded(this.courts);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardCubit(this.getDashboardDataUseCase) : super(DashboardInitial());

  Future<void> fetchDashboardData() async {
    emit(DashboardLoading());
    final result = await getDashboardDataUseCase();
    result.fold(
      (failure) => emit(DashboardError(failure.toString())),
      (courts) => emit(DashboardLoaded(courts)),
    );
  }
}
