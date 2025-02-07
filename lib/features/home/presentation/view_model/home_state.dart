import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:futsal_booking/features/home/presentation/view/bottom_view/dashboard_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        DashboardView(),
        const Center(child: Text('Schedule Placeholder')),
        const Center(child: Text('Arena Placeholder')),
        const Center(child: Text('Profile Placeholder')),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}