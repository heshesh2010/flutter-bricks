import 'package:mason/mason.dart';

Future run(HookContext context) async {
  final logger = context.logger;

  final stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  final isBloc = stateManagement == 'bloc';
  final isCubit = stateManagement == 'cubit';
  final isProvider = stateManagement == 'provider';
  final isRiverpod = stateManagement == 'riverpod';
  final isGetx = stateManagement == 'getx';
  final isNone = !isBloc && !isCubit && !isProvider && !isRiverpod && !isGetx;

  if (isNone) {
    logger.alert(
      red.wrap(
        'No state management selected. Please select a state management to continue.',
      ),
    );
    throw Exception();
  }

  context.vars = {
    ...context.vars,
    'isBloc': isBloc,
    'isCubit': isCubit,
    'isProvider': isProvider,
    'isRiverpod': isRiverpod,
    'isGetx': isGetx,
    'isNone': isNone,
  };
}
