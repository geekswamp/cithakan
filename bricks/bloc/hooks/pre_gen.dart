import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _runChoose(context);
}

Future<void> _runChoose(HookContext context) async {
  final type = context.vars['bloc_type'];
  final progress = context.logger.progress('Generate data source...');

  context.vars = {
    ...context.vars,
    'use_bloc': type == 'bloc',
    'use_cubit': type == 'cubit',
  };

  progress.complete();
}
