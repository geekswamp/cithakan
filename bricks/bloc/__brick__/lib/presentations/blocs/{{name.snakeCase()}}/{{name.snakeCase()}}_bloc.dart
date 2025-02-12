import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc(this._fetchUseCase) : super(const {{name.pascalCase()}}State.initial()) {
    on<{{name.pascalCase()}}Fetch>(_onFetch);
    on<{{name.pascalCase()}}Add>(_onAdd);
    on<{{name.pascalCase()}}Update>(_onUpdate);
    on<{{name.pascalCase()}}Delete>(_onDelete);
  }

  final {{name.pascalCase()}}FetchUseCase _fetchUseCase;

  void _onFetch({{name.pascalCase()}}Fetch event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(const {{name.pascalCase()}}State.inProgress());

    (await _fetchUseCase(null).run()).match(
      (l) {
        emit(const {{name.pascalCase()}}State.failure(l.message));
      },
      (r) {
        emit(const {{name.pascalCase()}}State.success(r.data));
      },
    );
  }

  void _onAdd({{name.pascalCase()}}Add event, Emitter<{{name.pascalCase()}}State> emit) async {
    // TODO: Implement your logic here.
    emit(const {{name.pascalCase()}}State.inProgress());
  }

  void _onUpdate({{name.pascalCase()}}Update event, Emitter<{{name.pascalCase()}}State> emit) async {
    // TODO: Implement your logic here.
    emit(const {{name.pascalCase()}}State.inProgress());
  }

  void _onDelete({{name.pascalCase()}}Delete event, Emitter<{{name.pascalCase()}}State> emit) async {
    // TODO: Implement your logic here.
    emit(const {{name.pascalCase()}}State.inProgress());
  }
}