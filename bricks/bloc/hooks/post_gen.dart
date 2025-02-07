import 'package:mason/mason.dart';

void run(HookContext context) async {
  _runAddDependencies;
}


void _runAddDependencies(HookContext context) async {
  final progress = context.logger.progress('Adding dependencies...');

  await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);

  progress.compete();
}