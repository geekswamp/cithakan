import 'dart:isolate';

import 'failure.dart';
import 'network/dio_client.dart';

/// {@template isolate_parser}
/// A class that will be used to parse the [json] data in the isolate.
/// {@endtemplate}
final class IsolateParser<T> {
  /// {@macro isolate_parser}
  IsolateParser(this.json, this.converter);

  /// The [json] data that will be parsed.
  final Map<String, dynamic> json;

  /// The converter that will be used to convert the [json] data to a specific type.
  final ResponseConverter<T> converter;

  final String _debugName = 'PARSE_IN_BACKGROUND';

  /// Parse large [json] in background.
  Future<T> parseInBackground() async {
    final ReceivePort receivePort = ReceivePort(_debugName);
    await Isolate.spawn(
      _parse,
      _IsolateData<T>(receivePort.sendPort, json, converter),
    );

    final dynamic result = await receivePort.first;

    if (result is IsolateParserFailure) {
      throw Exception(result.message);
    } else {
      return result as T;
    }
  }
}

/// Helper class to parse the [json] data in the isolate.
final class _IsolateData<T> {
  _IsolateData(this.sendPort, this.json, this.converter);

  /// The [SendPort] that will be used to send the result back to the main isolate.
  final SendPort sendPort;

  /// The [json] data that will be parsed.
  final Map<String, dynamic> json;

  /// The converter that will be used to convert the [json] data to a specific type.
  final ResponseConverter<T> converter;
}

/// A function that will be used to parse the [json] data in the isolate.
void _parse<T>(_IsolateData<T> data) {
  try {
    final result = data.converter(data.json);
    Isolate.exit(data.sendPort, result);
  } catch (e) {
    Isolate.exit(data.sendPort, IsolateParserFailure(e.toString()));
  }
}
