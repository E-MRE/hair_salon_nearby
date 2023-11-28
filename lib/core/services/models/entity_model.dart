abstract class EntityModel<TModel> {
  const EntityModel();

  TModel fromJson(Map<String, dynamic> json);
}
