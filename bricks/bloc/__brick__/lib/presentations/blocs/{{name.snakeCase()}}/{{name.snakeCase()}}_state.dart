part of '{{name.snakeCase()}}_bloc.dart';

@freezed
sealed class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  // TODO: Please customize your state if needed.
  const factory {{name.pascalCase()}}State.initial() = _{{name.pascalCase()}}Initial;
  const factory {{name.pascalCase()}}State.inProgress() = _{{name.pascalCase()}}LoadInProgress;
  const factory {{name.pascalCase()}}State.success({{name.pascalCase()}} data, [@Default('') String message]) = _{{name.pascalCase()}}LoadSuccess;
  const factory {{name.pascalCase()}}State.failure(String error) = _{{name.pascalCase()}}LoadFailure;
}
