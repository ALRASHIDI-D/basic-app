// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  @override
  final String? message;
  const FetchDataException(this.message) : super("Error During Connection");
}

class FormatDataException extends ServerException {
  const FormatDataException([message]) : super("Error Formating Data");
}

class BadRequestException extends ServerException {
  @override
  final String? message;
  const BadRequestException(this.message) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  @override
  final String? message;
  const UnauthorizedException(this.message) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super("Requested Not Found");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super("No Internet Connection");
}

class FormatingException extends ServerException {
  const FormatingException([message]) : super("Formarting error");
}
