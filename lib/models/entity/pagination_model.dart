import 'package:hair_salon_nearby/core/services/models/entity_model.dart';

abstract class PaginationModel<TModel extends EntityModel<TModel>> extends EntityModel<PaginationModel<TModel>> {
  final List<TModel>? items;
  final int? pageIndex;
  final int? totalPages;
  final int? totalCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  const PaginationModel({
    this.items,
    this.pageIndex,
    this.totalPages,
    this.totalCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });
}
