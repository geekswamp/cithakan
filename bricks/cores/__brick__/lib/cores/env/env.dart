import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true, useConstantCase: true)
abstract class Env {
  // TODO: Please customize your env if needed.
  @EnviedField()
  static String baseUrl = _Env.baseUrl;

  @EnviedField()
  static String baseUrlDev = _Env.baseUrlDev;
}
