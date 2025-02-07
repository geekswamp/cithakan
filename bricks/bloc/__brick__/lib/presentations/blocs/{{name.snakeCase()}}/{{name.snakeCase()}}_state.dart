part of '{{name.snakeCase()}}_bloc.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  // TODO: Add your named parameters.
  const factory {{name.pascalCase()}}State({
    @Default('') String message,
    @Default(false) bool isLoading,
    @Default(null) {{name.pascalCase()}}? data,
  }) = _{{name.pascalCase()}}State;

  factory {{name.pascalCase()}}State.initial() {
    return const {{name.pascalCase()}}State();
  }

  factory {{name.pascalCase()}}State.loading() {
    return const {{name.pascalCase()}}State(message: '', isLoading: true);
  }

  factory {{name.pascalCase()}}State.loaded({{name.pascalCase()}} data, [String message = '']) {
    return {{name.pascalCase()}}State(
      message: message,
      isLoading: false,
      data: data,
    );
  }

  factory {{name.pascalCase()}}State.failure(String error) {
    return {{name.pascalCase()}}State(message: error, isLoading: false);
  }
}