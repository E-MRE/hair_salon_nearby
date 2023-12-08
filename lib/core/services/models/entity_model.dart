import 'package:equatable/equatable.dart';

abstract class EntityModel<TModel> extends Equatable {
  const EntityModel();

  TModel fromJson(Map<String, dynamic> json);
}
