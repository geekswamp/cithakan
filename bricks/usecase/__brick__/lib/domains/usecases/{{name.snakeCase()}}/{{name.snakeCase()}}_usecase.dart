import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class {{name.pascalCase()}}FetchUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}FetchUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, void> call(params) {
    return _repository.fetch(params);
  }
}

@lazySingleton
class {{name.pascalCase()}}AddUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}AddUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, void> call(params) {
    return _repository.add(params);
  }
}

@lazySingleton
class {{name.pascalCase()}}UpdateUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}UpdateUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, void> call(params) {
    return _repository.update(params);
  }
}