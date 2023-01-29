import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final List<dynamic> properties;
  const Failure(this.message, [this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {
  final int statusCode;
  const ServerFailure(String message, this.statusCode) : super(message);

  @override
  List<Object> get props => [message, statusCode];
}

class FailureSimulation extends Failure {
  const FailureSimulation({String message = "Error"})
      : super(
          message,
        );
}
