part of '{{name.snakeCase()}}_bloc.dart';

@freezed
sealed class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  // TODO: Please customize your state if needed.
  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.loaded({{name.pascalCase()}} data, [@Default('') String message]) = _Loaded;
  const factory {{name.pascalCase()}}State.failure(String error) = _Failure;
}
