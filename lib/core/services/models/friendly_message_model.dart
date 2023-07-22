import 'package:json_annotation/json_annotation.dart';

part 'friendly_message_model.g.dart';

@JsonSerializable()
class FriendlyMessageModel {
  final String? title;
  final String? message;

  FriendlyMessageModel({this.title, this.message});

  factory FriendlyMessageModel.fromJson(Map<String, dynamic> json) => _$FriendlyMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendlyMessageModelToJson(this);
}
