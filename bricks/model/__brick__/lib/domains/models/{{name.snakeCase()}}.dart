import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
sealed class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  // TODO: Add your named parameters.
  const factory {{name.pascalCase()}}({
    required String id,
    @JsonKey(name: 'full_name') required String name,
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json)
    => _${{name.pascalCase()}}FromJson(json)
}