import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract interface class {{name.pascalCase()}}Repository {
  // TODO: Please customize your methods if needed.
  TaskEither<Failure, {{name.pascalCase()}}> get();
  TaskEither<Failure, {{name.pascaslCase()}}> add();
  TaskEither<Failure, {{name.pascaslCase()}}> update();
}