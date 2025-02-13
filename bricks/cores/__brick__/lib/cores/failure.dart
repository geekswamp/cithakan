import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure implements Exception {
  const factory Failure.cache([
    @Default('') String message,
    StackTrace? stackTrace,
  ]) = CacheFailure;
  const factory Failure.server([
    @Default('') String message,
    StackTrace? stackTrace,
  ]) = ServerFailure;
  const factory Failure.isolateParser([
    @Default('') String message,
    StackTrace? stackTrace,
  ]) = IsolateParserFailure;
}
