import 'entity_model.dart';

abstract class LocalStorageModel<TModel extends Object> extends EntityModel<TModel> {
  const LocalStorageModel();

  TModel fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
