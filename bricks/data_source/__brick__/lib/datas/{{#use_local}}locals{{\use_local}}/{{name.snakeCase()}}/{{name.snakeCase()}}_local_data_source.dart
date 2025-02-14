import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract interface class {{name.pascalCase()}}LocalDataSource {
  // TODO: Please customize your methods if needed.
  {{#use_single}}{{> single }}{{/use_single}}{{#use_list}}{{> list }}{{/use_list}}{{#use_none}}{{> none }}{{/use_none}}
}

@LazySingleton(as: {{name.pascalCase()}}LocalDataSource)
final class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  const {{name.pascalCase()}}LocalDataSourceImpl(this._client);

  final DioClient _client;

  {{#use_single}}{{> single2 }}{{/use_single}}{{#use_list}}{{> list2 }}{{/use_list}}{{#use_none}}{{> none2 }}{{/use_none}}
}