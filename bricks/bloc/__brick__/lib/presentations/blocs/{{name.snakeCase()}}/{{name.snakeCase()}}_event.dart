part of '{{name.snakeCase()}}_bloc.dart';

@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  // TODO: Please customize your event if needed.
  const factory {{name.pascalCase()}}Event.fetch() = _{{name.pascalCase()}}Fetch;
  const factory {{name.pascalCase()}}Event.add({required {{name.pascalCase()}} data}) = _{{name.pascalCase()}}Add;
  const factory {{name.pascalCase()}}Event.update({required String id, required {{name.pascalCase()}} data}) = _{{name.pascalCase()}}Update;
  const factory {{name.pascalCase()}}Event.delete({required String id}) = _{{name.pascalCase()}}Delete;
}
