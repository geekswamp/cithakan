import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
final class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
// TODO: Please customize your methods if needed.
  const {{name.pascalCase()}}RepositoryImpl(this._remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  @override
  TaskEither<Failure, {{name.pascalCase()}}> fetch() {
    return _remoteDataSource.fetch();
  }

  @override
  TaskEither<Failure, {{name.pascalCase()}}> add() {
    return _remoteDataSource.add();
  }

  @override
  TaskEither<Failure, {{name.pascalCase()}}> update() {
    return _remoteDataSource.update();
  }
}