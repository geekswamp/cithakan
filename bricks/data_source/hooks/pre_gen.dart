import 'package:mason/mason.dart';

void run(HookContext context) async {
  _runChoose;
}

void _runChoose(HookContext context) async {
  final type = context.vars['data_source_type'];
  final progress = context.logger.progress('Generate data source...');

  context.vars = {
    ...context.vars,
    'use_local': type == 'local',
    'use_remote': type == 'remote',
  };

  progress.complete();
}
