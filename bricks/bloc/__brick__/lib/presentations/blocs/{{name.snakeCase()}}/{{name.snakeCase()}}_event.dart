part of '{{name.snakeCase()}}_bloc.dart';

@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  // TODO: Please customize your event if needed.
  const factory {{name.pascalCase()}}Event.get({{name.pascalCase()}} data) = _{{name.pascalCase()}}Get;
  const factory {{name.pascalCase()}}Event.add({{name.pascalCase()}} data) = _{{name.pascalCase()}}Add;
  const factory {{name.pascalCase()}}Event.update({{name.pascalCase()}} data) = _{{name.pascalCase()}}Update;
}