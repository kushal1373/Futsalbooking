// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   final String message;

//   const Failure({required this.message});

//   @override
//   List<Object> get props => [message];
// }

// class LocalDatabaseFailure extends Failure {
//   const LocalDatabaseFailure({required super.message});
// }

// class ApiFailure extends Failure {
//   final int? statusCode;
//   const ApiFailure({
//     this.statusCode,
//     required super.message,
//   });
// }

// class SharedPrefsFailure extends Failure {
//   const SharedPrefsFailure({
//     required super.message,
//   });
// }

// class ServerFailure extends Failure {
//   const ServerFailure({required String message}) : super(message: message);
// }


import 'package:equatable/equatable.dart';

/// Base class for all failures across the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

/// Represents failures related to local database operations.
class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({required super.message});
}

/// Represents failures occurring from API responses (e.g., 4xx, 5xx).
class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({
    this.statusCode,
    required super.message,
  });
}

/// Represents failures when accessing or writing SharedPreferences data.
class SharedPrefsFailure extends Failure {
  const SharedPrefsFailure({required super.message});
}

/// Represents failures that originate from the server (generic).
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// Represents network-related failures (no internet, timeouts, etc.).
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

/// Represents caching failures (data storage issues).
class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
