import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
final class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
// TODO: Please customize your methods if needed.
  const {{name.pascalCase()}}RepositoryImpl(this._remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  {{#use_single}}{{> single }}{{/use_single}}{{#use_list}}{{> list }}{{/use_list}}{{#use_none}}{{> none }}{{/use_none}}
}