[![Cithakan Demo](https://asciinema.org/a/1ulNkd7sjRvu5kZbzs8FmXvuJ.svg "Cithakan Demo")](https://asciinema.org/a/1ulNkd7sjRvu5kZbzs8FmXvuJ)

# Cithakan 🧱

[Cithakan] comes from the [Javanese language], meaning "**Template**". This project is a collection of templates designed to accelerate [Flutter] application development by leveraging the power of [Mason].

## Installation

Ensure that  you have [Mason] installed before using Cithakan. If not, install it with the following command:

```bash
dart pub global activate mason_cli
```

Then, add Cithakan to [Mason] by running:

```bash
mason add <BRICK_NAME> -g --git-url https://github.com/geekswamp/cithakan --git-path bricks/<BRICK_NAME>
```

For example:

```bash
mason add bloc -g --git-url https://github.com/geekswamp/cithakan --git-path bricks/bloc
```

Available bricks:

- [bloc](https://github.com/geekswamp/cithakan/tree/main/bricks/bloc)
- [data_source](https://github.com/geekswamp/cithakan/tree/main/bricks/data_source)
- [di (dependency injection)](https://github.com/geekswamp/cithakan/tree/main/bricks/di)
- [env](https://github.com/geekswamp/cithakan/tree/main/bricks/env)
- [failure](https://github.com/geekswamp/cithakan/tree/main/bricks/failure)
- [model](https://github.com/geekswamp/cithakan/tree/main/bricks/model)
- [modules](https://github.com/geekswamp/cithakan/tree/main/bricks/modules)
- [network](https://github.com/geekswamp/cithakan/tree/main/bricks/network)
- [repository](https://github.com/geekswamp/cithakan/tree/main/bricks/repository)
- [storage](https://github.com/geekswamp/cithakan/tree/main/bricks/storage)

## Usage

After installation, you can generate a template using the following command:

```bash
mason make <BRICK_NAME>
```

For example:

```bash
mason make bloc
```

Follow the on-screen instructions to customize the template to your project's needs.

## Dependencies Used

- [dio] is a powerful HTTP client for Dart, used for making network requests with features like interceptors, request cancellation, and automatic retries.
- [envied] is used for managing environment variables securely within the Flutter application.
- [fpdart] is a functional programming library for Dart that provides powerful monads like Either, Option, and Task to improve code safety and maintainability.
- [freezed] helps in generation immutable classes and union types, making data modeling and serialization easier.
- [flutter_secure_storage] is used for securely storing sensitive data, such as authentication tokens and user credentials, using platform-specific encrypted storage.
- [flutter_bloc] is used for state management, providing a predictable way to manage application state using the BLoC pattern.
- [get_it] is a simple yet powerful service locator for Dart, used to manage dependencies efficiently without relying on Flutter’s `BuildContext`.
- [injectable] is used for dependency injection, allowing for a modular and testable codebase.
- [json_serializable] is used to automate the serialization and deserialization of JSON data, reducing boilerplate code and ensuring type safety.

## Limitation

[freezed] does not allow inheriting from its generated classes. Instead of inheritance, it is recommended to use **composition** ([source]). For example:

```dart
@freezed
class OtherParams with _$OtherParams {
  const factory OtherParams({
    required QueryParams queryParams,
  }) = _OtherParams;
}
```

## Project Structure

A generated project using [Cithakan] follows this structure:

```
lib/
├── cores/
│   ├── di/
│   │   └── di.dart
│   ├── env/
│   │   └── env.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── dio_client_impl.dart
│   │   └── network_interceptor.dart
│   ├── storage/
│   │   ├── base_storage.dart
│   │   └── secure_storage.dart
│   ├── failure.dart
│   ├── isolate_parser.dart
│   ├── modules.dart
│   └── use_case.dart
├── datas/
│   ├── locals/
│   │   ├── data_sources/
│   │   │   └── some_local_data_source/
│   │   │       └── some_local_data_source.dart
│   │   └── repositories/
│   │       └── some_repository/
│   │           └── some_repository_impl.dart
│   └── remotes/
│       ├── data_sources/
│       │   └── some_remote_data_source/
│       │       └── some_remote_data_source.dart
│       └── repositories/
│           └── some_repository/
│               └── some_repository_impl.dart
├── domains/
│   ├── models/
│   │   └── some_model.dart
│   ├── repositories/
│   │   └── some_repository/
│   │       └── some_repository.dart
│   └── usecases/
│       └── some_usecase/
│           └── some_usecase.dart
└── presentations/
    ├── blocs/
    │   └── some/
    │       ├── some_bloc.dart
    │       ├── some_event.dart
    │       └── some_state.dart
    └── cubits/
        └── some/
            ├── some_cubit.dart
            └── some_state.dart
```

This structure ensures a well-organized codebase for easier maintenance and scalability.


<!-- Links -->
[Javanese language]: https://en.wikipedia.org/wiki/Javanese_language
[Mason]: https://pub.dev/packages/mason
[Flutter]: https://flutter.dev
[Cithakan]: https://github.com/geekswamp/cithakan.git
[dio]: https://pub.dev/packages/dio
[envied]: https://pub.dev/packages/envied
[fpdart]: https://pub.dev/packages/fpdart
[freezed]: https://pub.dev/packages/freezed
[flutter_secure_storage]: https://pub.dev/packages/flutter_secure_storage
[flutter_bloc]: https://pub.dev/packages/flutter_bloc
[get_it]: https://pub.dev/packages/get_it
[injectable]: https://pub.dev/packages/injectable
[json_serializable]: https://pub.dev/packages/json_serializable
[source]: https://github.com/rrousselGit/freezed/issues/464#issuecomment-861376932