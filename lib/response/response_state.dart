enum Status { none, loading, complete, error, errorWithCode }

class ADResponseState<T> {
  Status? viewStatus;
  T? data;
  String? message;
  String? errorCode;
  String? successCode;

  ADResponseState(this.viewStatus, this.data, this.message, this.errorCode);

  ADResponseState.init() : viewStatus = Status.none;

  ADResponseState.loading() : viewStatus = Status.loading;

  ADResponseState.completed(this.data, [this.successCode]) : viewStatus = Status.complete;

  ADResponseState.error(this.message, [this.errorCode])
      : viewStatus = Status.error;

  ADResponseState.errorWithCode(this.message, [this.errorCode])
      : viewStatus = Status.error;

  @override
  String toString() {
    return 'ADResponseState{viewStatus: $viewStatus, data: $data, message: $message, errorCode: $errorCode}';
  }
}