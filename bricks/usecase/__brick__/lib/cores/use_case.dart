import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';

import 'failure.dart';

part 'use_case.freezed.dart';

/// {@template use_case}
/// [UseCase] is an abstract class that defines the use case for the application.
///
/// [T] is the return type of the use case.
///
/// [P] is the parameter type of the use case.
///
/// Example:
/// ```dart
/// class GetAccessTokenUseCase implements UseCase<String, void> {
///   const GetAccessTokenUseCase();
///
///   @override
///   TaskEither<Failure, String> call(void params) {}
/// }
///  ```
/// {@endtemplate}
abstract class UseCase<T, P extends dynamic> {
  /// {@macro use_case}
  const UseCase();

  /// Call the use case with the given parameters.
  TaskEither<Failure, T> call(P params);
}

/// {@template login_params}
/// [LoginParams] is a class that defines the parameters for the login use case.
/// {@endtemplate}
@freezed
class QueryParams with _$QueryParams {
  const QueryParams._();

  /// {@macro login_params}
  const factory QueryParams({
    @Default(0) int? offset,
    @Default(10) int? limit,
    @Default(1) int? page,
    @Default(SortOrder.asc) SortOrder? sortOrder,
    String? search,
  }) = _QueryParams;

  /// Convert the parameters to a JSON object.
  Map<String, dynamic> toJson() {
    return Map<String, dynamic>.fromEntries(
        {
          'offset': offset,
          'limit': limit,
          'page': page,
          'search': search,
          'order': sortOrder?.value,
        }.entries.where((e) => e.value != null)
    );
  }
}

/// {@template sort_order}
/// Enum representing the sorting order (ascending or descending).
/// {@endtemplate}
enum SortOrder {
  /// Ascending order.
  asc('asc'),

  /// Descending order.
  desc('desc');

  /// {@macro sort_order}
  const SortOrder(this.value);

  /// The string value representing the sorting order.
  final String value;
}
