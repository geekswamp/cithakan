import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_cubit.freezed.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this._fetchUseCase) : super(const {{name.pascalCase()}}State.initial());

  final {{name.pascalCase()}}FetchUseCase _fetchUseCase;

  void fetch() async {
    emit(const {{name.pascalCase()}}State.inProgress());

    (await _fetchUseCase(null).run()).match(
      (l) {
        emit({{name.pascalCase()}}State.failure(l.message));
      },
      (r) {
        emit({{name.pascalCase()}}State.success(r));
      },
    );
  }
}