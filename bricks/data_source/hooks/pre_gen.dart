import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _runChoose(context);
}

Future<void> _runChoose(HookContext context) async {
  final type = context.vars['data_source_type'];
  final returnType = context.vars['return_type'];
  final progress = context.logger.progress('Generate data source...');

  context.vars = {
    ...context.vars,
    'use_local': type == 'local',
    'use_remote': type == 'remote',
    'use_single': returnType == 'single',
    'use_list': returnType == 'list',
    'use_none': returnType == 'none',
  };

  progress.complete();
}
