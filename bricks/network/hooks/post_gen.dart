import 'package:mason/mason.dart';

void run(HookContext context) async {
  _runAddDependencies;
  _runDartFormat;
  _runDartFix;
}

void _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'dio']);

  progress.compete();
}

void _runDartFormat(HookContext context) async {
  final progress = context.logger.progress('Running dart format...');

  await Process.run('dart', ['format', '.']);

  progress.complete();
}

void _runDartFix(HookContext context) async {
  final progress = context.logger.progress('Applying dart fix...');

  await Process.run('dart', ['fix', '--apply']);

  progress.complete();
}
