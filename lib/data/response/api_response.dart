import 'package:mvvm_architecture/data/response/status.dart';

class APIResponse<T> {
  Status? status;
  String? message;
  T? data;
  APIResponse(this.status, this.message, this.data);

  APIResponse.loading() : status = Status.LOADING;

  APIResponse.completed() : status = Status.COMPLETED;

  APIResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n  Message : $message \n Data : $data";
  }
}
