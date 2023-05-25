import 'entity_model.dart';

class EmptyEntityModel implements EntityModel<EmptyEntityModel> {
  @override
  EmptyEntityModel fromJson(Map<String, dynamic> json) => EmptyEntityModel();
}
