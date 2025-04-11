import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _runAddDependencies(context);
  await _runDartFormat(context);
  await _runDartFix(context);
}

Future<void> _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'dio']);
  await Process.run('flutter', ['pub', 'add', 'envied']);
  await Process.run('flutter', ['pub', 'add', 'freezed_annotation']);
  await Process.run('flutter', ['pub', 'add', 'flutter_secure_storage:^9.2.4']);
  await Process.run('flutter', ['pub', 'add', 'fpdart']);
  await Process.run('flutter', ['pub', 'add', 'get_it']);
  await Process.run('flutter', ['pub', 'add', 'injectable']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'build_runner']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'envied_generator']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'freezed']);
  await Process.run('flutter', ['pub', 'add', '--dev', 'injectable_generator']);
  await Process.run('flutter', [
    'pub',
    'upgrade',
    '--major-versions',
    '--tighten',
  ]);

  progress.complete();
}

Future<void> _runDartFormat(HookContext context) async {
  final progress = context.logger.progress('Running dart format...');

  await Process.run('dart', ['format', '.']);

  progress.complete();
}

Future<void> _runDartFix(HookContext context) async {
  final progress = context.logger.progress('Applying dart fix...');

  await Process.run('dart', ['fix', '--apply']);

  progress.complete();
}
