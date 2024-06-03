import "../errors/failure.dart";

class WidgetState<T> {
  T? data;
  Failure? failure;
  WidgetStatus status;

  WidgetState({
    this.data,
    this.failure,
    required this.status,
  });

  factory WidgetState.initial() => WidgetState(status: WidgetStatus.initial);

  factory WidgetState.loading() => WidgetState(status: WidgetStatus.loading);

  factory WidgetState.success(T data) {
    bool isEmpty = false;
    if (data is Iterable) {
      isEmpty = data.isEmpty;
    } else if (data is String) {
      isEmpty = data.isEmpty;
    } else if (data is Map) {
      isEmpty = data.isEmpty;
    } else if (data is List) {
      isEmpty = data.isEmpty;
    } else if (data is Set) {
      isEmpty = data.isEmpty;
    } else {
      isEmpty = false;
    }

    return WidgetState(
      data: data,
      status: isEmpty ? WidgetStatus.empty : WidgetStatus.success,
    );
  }

  factory WidgetState.failure(Failure failure) => WidgetState(
        failure: failure,
        status: WidgetStatus.failure,
      );

  @override
  bool operator ==(covariant WidgetState<T> other) {
    if (identical(this, other)) return true;

    return other.data == data &&
        other.failure == failure &&
        other.status == status;
  }

  @override
  int get hashCode => data.hashCode ^ failure.hashCode ^ status.hashCode;
}

enum WidgetStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}
