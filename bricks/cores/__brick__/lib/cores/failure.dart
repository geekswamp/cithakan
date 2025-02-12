import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure implements Exception {
  const factory Failure.cache([String? message, StackTrace? stackTrace]) = CacheFailure;
  const factory Failure.server([String? message, StackTrace? stackTrace]) = ServerFailure;
  const factory Failure.isolateParser([String? message, StackTrace? stackTrace]) = IsolateParserFailure;
}