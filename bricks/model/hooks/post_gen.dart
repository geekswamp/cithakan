import 'package:mason/mason.dart';

void run(HookContext context) async {
  _runAddDependencies;
}


void _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'freezed_annotation']);
  await Process.run('flutter', ['pub', 'add', 'json_annotation']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'build_runner']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'freezed']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'json_serializable']);

  progress.complete();
}