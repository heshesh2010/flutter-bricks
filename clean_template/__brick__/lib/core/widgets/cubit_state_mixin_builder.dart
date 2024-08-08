import "package:flutter/material.dart";

import "../cubit_states/state_mixin.dart";
import "../errors/failure.dart";

class CubitStateMixinBuilder<T> extends StatelessWidget {
  /// The [StateMixin] used to determine wich widget to show
  final StateMixin state;

  /// The [Widget] to show when the state is [WidgetStatus.loading]
  ///
  /// If not provided, a [CircularProgressIndicator.adaptive()] will be shown
  final Widget? onLoading;

  /// The [Widget] to show when the state is [WidgetStatus.success]
  final Widget Function(T data) onSuccess;

  /// The [Widget] to show when the state is [WidgetStatus.failure]
  ///
  /// If not provided, a [Text] with the error message will be shown
  final Widget Function(Failure failure)? onFailure;

  /// The [Widget] to show when the state is [WidgetStatus.empty]
  ///
  /// If not provided, a [Text] with the message "No data found" will be shown
  final Widget? onEmpty;

  /// The [Widget] to show when the state is [WidgetStatus.initial]
  final Widget? onInitial;

  const CubitStateMixinBuilder({
    super.key,
    required this.state,
    required this.onSuccess,
    this.onLoading,
    this.onFailure,
    this.onEmpty,
    this.onInitial,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case WidgetStatus.initial:
        return onInitial ?? const SizedBox.shrink();
      case WidgetStatus.loading:
        return onLoading ?? const CircularProgressIndicator.adaptive();
      case WidgetStatus.success:
        return onSuccess(state.data as T);
      case WidgetStatus.failure:
        return onFailure?.call(state.failure as Failure) ??
            Text(state.failure?.message ?? "An error occurred");
      case WidgetStatus.empty:
        return onEmpty ?? const Text("No data found");
    }
  }
}
