import 'package:json_annotation/json_annotation.dart';

part 'example_request.g.dart';

//Request Class Örneği. İhtiyacın yoksa kaldır.
@JsonSerializable(fieldRename: FieldRename.pascal, createFactory: false)
class ExampleRequest {
  String? operation;
  String? username;
  int? count;

  ExampleRequest({this.operation, this.username, this.count});

  Map<String, dynamic> toJson() => _$ExampleRequestToJson(this);
}
