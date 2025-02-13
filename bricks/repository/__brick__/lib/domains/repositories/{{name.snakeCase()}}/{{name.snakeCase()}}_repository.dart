import 'package:fpdart/fpdart.dart';

abstract interface class {{name.pascalCase()}}Repository {
  // TODO: Please customize your methods if needed.
  TaskEither<Failure, {{name.pascalCase()}}> fetch();
  TaskEither<Failure, {{name.pascalCase()}}> add();
  TaskEither<Failure, {{name.pascalCase()}}> update();
}