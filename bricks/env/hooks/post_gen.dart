import 'package:mason/mason.dart';

void run(HookContext context) async {
  _runAddDependencies;
}


void _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'envied']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'build_runner']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'envied_generator']);

  progress.complete();
}