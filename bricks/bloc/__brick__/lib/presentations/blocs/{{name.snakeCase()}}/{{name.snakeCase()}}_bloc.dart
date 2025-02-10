import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super(const {{name.pascalCase()}}State.initial()) {
    on<{{name.pascalCase()}}Event.fetch>(_onFetch);
    on<{{name.pascalCase()}}Event.add>(_onAdd);
    on<{{name.pascalCase()}}Event.update>(_onUpdate);
    on<{{name.pascalCase()}}Event.delete>(_onDelete);
  }

  void _onFetch({{name.pascalCase()}}Event.fetch event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.loading());
  }

  void _onAdd({{name.pascalCase()}}Event.add event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.loading());
  }

  void _onUpdate({{name.pascalCase()}}Event.update event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.loading());
  }

  void _onDelete({{name.pascalCase()}}Event.delete event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.loading());
  }
}