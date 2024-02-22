import 'package:flutter/material.dart';

import '../cubit_states/widget_state.dart';
import '../errors/failures.dart';

class CubitWidgetStateLoader<T> extends StatelessWidget {
  /// The [WidgetState] used to determine wich widget to show
  final WidgetState state;

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

  const CubitWidgetStateLoader({
    Key? key,
    required this.state,
    required this.onSuccess,
    this.onLoading,
    this.onFailure,
    this.onEmpty,
    this.onInitial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case WidgetStatus.initial:
        return onInitial ?? const SizedBox.shrink();
      case WidgetStatus.loading:
        return onLoading ?? CircularProgressIndicator.adaptive();
      case WidgetStatus.success:
        return onSuccess(state.data as T);
      case WidgetStatus.failure:
        return onFailure?.call(state.failure as Failure) ??
            Text(state.failure?.errorMessage ?? 'An error occurred');
      case WidgetStatus.empty:
        return onEmpty ?? Text('No data found');
    }
  }
}
