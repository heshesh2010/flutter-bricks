import "../errors/failure.dart";

class StateMixin<T> {
  T? data;
  Failure? failure;
  WidgetStatus status;

  StateMixin({
    this.data,
    this.failure,
    required this.status,
  });

  factory StateMixin.initial() => StateMixin(status: WidgetStatus.initial);

  factory StateMixin.loading() => StateMixin(status: WidgetStatus.loading);

  factory StateMixin.success(T data) {
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

    return StateMixin(
      data: data,
      status: isEmpty ? WidgetStatus.empty : WidgetStatus.success,
    );
  }

  factory StateMixin.failure(Failure failure) => StateMixin(
        failure: failure,
        status: WidgetStatus.failure,
      );

  @override
  bool operator ==(covariant StateMixin<T> other) {
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
