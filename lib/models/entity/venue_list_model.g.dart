// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueListModel _$VenueListModelFromJson(Map<String, dynamic> json) =>
    VenueListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => VenueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageIndex: json['pageIndex'] as int?,
      totalCount: json['totalCount'] as int?,
      totalPages: json['totalPages'] as int?,
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
    );
