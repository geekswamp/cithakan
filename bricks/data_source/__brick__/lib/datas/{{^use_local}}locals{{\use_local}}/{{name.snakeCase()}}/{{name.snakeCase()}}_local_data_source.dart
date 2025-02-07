import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract interface class {{name.pascalCase()}}LocalDataSource {
  // TODO: Please customize your methods if needed.
  TaskEither<Failure, {{name.pascalCase()}}> get();
  TaskEither<Failure, {{name.pascaslCase()}}> add();
  TaskEither<Failure, {{name.pascaslCase()}}> update();
}

@LazySingleton(as: {{name.pascalCase()}}LocalDataSource)
final class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  const {{name.pascalCase()}}LocalDataSourceImpl(this._client);

  final DioClient _client;

  @override
  TaskEither<Failure, {{name.pascalCase()}}> get() {
    return _client.get(
      '', // TODO: Add your path URL.
      (resp) => {{name.pascalCase()}}.fromJson(resp['data']),
    )
  }

  @override
  TaskEither<Failure, {{name.pascalCase()}}> add() {
    return _client.post(
      '', // TODO: Add your path URL.
      (resp) => {{name.pascalCase()}}.fromJson(resp['data']),
      data: {}
    )
  }

  @override
  TaskEither<Failure, {{name.pascalCase()}}> update() {
    return _client.patch(
      '', // TODO: Add your path URL.
      (resp) => {{name.pascalCase()}}.fromJson(resp['data']),
      data: {}
    )
  }
}