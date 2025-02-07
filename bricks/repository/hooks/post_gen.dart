import 'package:mason/mason.dart';

void run(HookContext context) {
  _runAddDependencies;
}


void _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'fpdart']);
  await Process.run('flutter', ['pub', 'add', 'injectable']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'build_runner']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'injectable_generator']);

  progress.compete();
}