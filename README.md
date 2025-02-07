# Cithakan 🧱

[Cithakan] comes from the [Javanese language], meaning "**Template**". This project is a collection of templates designed to accelerate [Flutter] application development by leveraging the power of [Mason].

## Installation

Ensure that  you have [Mason] installed before using Cithakan. If not, install it with the following command:

```bash
dart pub global activate mason_cli
```

Then, add Cithakan to [Mason] by running:

```bash
mason add cithakan --git-url https://github.com/geekswamp/cithakan.git
```

## Usage

After installation, you can generate a template using the following command:

```bash
mason make cithakan
```

## Dependecies Used

- [envied] is used for managing environment variables securely within the Flutter application.
- [freezed] helps in generation immutable classes and union types, making data modeling and serialization easier.
- [flutter_bloc] is used for state management, providing a predictable way to manage application state using the BLoC pattern.
- [injectable] is used for dependency injection, allowing for a modular and testable codebase.
- [json_serializable] is used to automate the serialization and deserialization of JSON data, reducing boilerplate code and ensuring type safety.

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


Follow the on-screen instructions to customize the template to your project's needs.

<!-- Links -->
[Javanese language]: https://en.wikipedia.org/wiki/Javanese_language
[Mason]: https://pub.dev/packages/mason
[Flutter]: https://flutter.dev
[Cithakan]: https://github.com/geekswamp/cithakan.git
[envied]: https://pub.dev/packages/envied
[freezed]: https://pub.dev/packages/freezed
[flutter_bloc]: https://pub.dev/packages/flutter_bloc
[injectable]: https://pub.dev/packages/injectable
[json_serializable]: https://pub.dev/packages/json_serializable