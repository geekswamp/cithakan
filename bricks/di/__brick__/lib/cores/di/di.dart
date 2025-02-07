import 'di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Define [GetIt] instance
final GetIt getIt = GetIt.instance;

/// Initialize [GetIt] for dependencies injection. Can used in `main()` method
/// inside `main.dart` file or inside `setUp()` method when using testing.
/// Example inside `main.dart`.
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   configureDI(Environment.dev);
///   runApp(const MyApp());
///  }
///  ```
@InjectableInit(
  preferRelativeImports: true,
  generateForDir: ['lib', 'test'],
)
void configureDI(String env) async {
  getIt.init(environment: env);
  await getIt.allReady(timeout: const Duration(seconds: 30));
}
