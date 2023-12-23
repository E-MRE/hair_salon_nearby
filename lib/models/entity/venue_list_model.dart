import 'package:hair_salon_nearby/models/entity/pagination_model.dart';
import 'package:hair_salon_nearby/models/entity/venue_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue_list_model.g.dart';

@JsonSerializable(createToJson: false)
final class VenueListModel extends PaginationModel<VenueModel> {
  const VenueListModel({
    super.items,
    super.pageIndex,
    super.totalCount,
    super.totalPages,
    super.hasNextPage,
    super.hasPreviousPage,
  });

  factory VenueListModel.fromJson(Map<String, dynamic> json) => _$VenueListModelFromJson(json);

  @override
  VenueListModel fromJson(Map<String, dynamic> json) => VenueListModel.fromJson(json);

  @override
  List<Object?> get props => [
        items,
        pageIndex,
        totalPages,
        totalCount,
        hasPreviousPage,
        hasNextPage,
      ];
}
