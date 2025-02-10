import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _runAddDependencies(context);
  await _runDartFormat(context);
  await _runDartFix(context);
}

Future<void> _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);

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
