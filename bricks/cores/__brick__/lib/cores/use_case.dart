import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';

import 'failure.dart';

part 'use_case.freezed.dart';
part 'use_case.g.dart';

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

/// {@template query_params}
/// [QueryParams] is a class that defines the URL parameters.
/// {@endtemplate}
@freezed
@JsonSerializable()
class QueryParams with _$QueryParams {
  /// {@macro query_params}
  QueryParams({
    @JsonKey(name: 'offset', defaultValue: 0) this.offset = 0,
    @JsonKey(name: 'limit', defaultValue: 10) this.limit = 10,
    @JsonKey(name: 'page', defaultValue: 1) this.page = 1,
    @JsonKey(name: 'order', defaultValue: SortOrder.asc)
    this.sortOrder = SortOrder.asc,
    @JsonKey(name: 'search') this.search,
  });

  @override
  final int? offset;

  @override
  final int? limit;

  @override
  final int? page;

  @override
  final String? search;

  @override
  final SortOrder? sortOrder;

  factory QueryParams.fromJson(Map<String, dynamic> json) =>
      _$QueryParamsFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParamsToJson(this);
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
