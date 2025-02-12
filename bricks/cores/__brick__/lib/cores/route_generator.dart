import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template route_generator}
/// A class to generate the route based on the settings.
/// Use this class inside `main.dart` file like this:
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return MaterialApp(
///     ...
///     onGenerateRoute: (settings) {
///       return RouteGenerator(settings).generate();
///     },
///   );
/// }
/// ```
/// {@endtemplate}
final class RouteGenerator {
  /// {@macro route_generator}
  const RouteGenerator(this._settings);

  final RouteSettings _settings;

  // TODO: Please add your route, BLoC, and page.
  Route<dynamic>? generate() {
    return MaterialPageRoute(
      builder: (context) {
        switch (_settings.name) {
          case '/page-one':
            return BlocProvider(
                create: (context) => getIt<SomeBloc>(),
                child: const Placeholder(),
            );
          case '/page-two':
            return BlocProvider(
              create: (context) => getIt<OtherBloc>(),
              child: const Placeholder(),
            );
          default:
            return const Scaffold(body: Center(child: Text('Page Not Found')));
        }
      }
    );
  }
}