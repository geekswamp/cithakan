import 'package:fpdart/fpdart.dart';

abstract interface class {{name.pascalCase()}}Repository {
  // TODO: Please customize your methods if needed.
  {{#use_single}}{{> single2 }}{{/use_single}}{{#use_list}}{{> list2 }}{{/use_list}}{{#use_none}}{{> none2 }}{{/use_none}}
}