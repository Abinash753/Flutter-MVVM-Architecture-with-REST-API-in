class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() => "$_prefix $_message";
}

//exception for error in connection
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error occured during communication");
}

//class for invalid request exception
class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid Url/request");
}

//class for unauthorized exception
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, "Unauthorized request");
}

//class for   invalid input exception
class InvalidInputException extends AppException {
  InvalidInputException(String? message) : super(message, "Invalid Input");
}
