import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class {{name.pascalCase()}}FetchUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}FetchUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, {{name.pascalCase()}}> call(params) {
    return _repository.fetch(params);
  }
}

@lazySingleton
class {{name.pascalCase()}}AddUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}AddUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, {{name.pascalCase()}}> call(params) {
    return _repository.add();
  }
}

@lazySingleton
class {{name.pascalCase()}}UpdateUseCase extends UseCase<{{name.pascalCase()}}, void> {
  const {{name.pascalCase()}}UpdateUseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  @override
  TaskEither<Failure, {{name.pascalCase()}}> call(params) {
    return _repository.update();
  }
}