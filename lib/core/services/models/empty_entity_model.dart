import 'entity_model.dart';

final class EmptyEntityModel extends EntityModel<EmptyEntityModel> {
  @override
  EmptyEntityModel fromJson(Map<String, dynamic> json) => EmptyEntityModel();

  @override
  List<Object?> get props => [];
}
