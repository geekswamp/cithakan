import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_bloc.g.dart';

@freezed
@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}State.initial()) {
    on<{{name.pascalCase()}}Event>(_doOperations);
  }

  void _doOperations({{name.pascalCase()}}Event event, Emitter<{{name.pascalCase()}}State> emit) async {
    event.when(
      get: (_) async {
        emit({{name.pascalCase()}}State.loading());
      },
      add: (e) async {
        emit({{name.pascalCase()}}State.loading());
      },
      update: (e) async {
        emit({{name.pascalCase()}}State.loading());
      }
    )
  }
}