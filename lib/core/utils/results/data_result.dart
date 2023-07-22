import 'result.dart';

///This class provides operation result, operation message and also provides data.
///If you want to return data with success and message info same time than use this class.
///This class is generic type so you must set your data type. Your data must be an object.
///
///Simple example:
///
///```dart
///Future<DataResult<CityModel>> getCities(String countryCode) async{
///   final cities = await _service.getCities(countryCode);
///   return cities == null ? DataResult.error(message:'Data is null') : DataResult.success(data: cities);
///}
///```
class DataResult<TData> extends Result {
  final TData? data;

  bool get isSuccessAndDataExists => success && data != null;

  bool get isNotSuccessOrDataNotExists => !isSuccessAndDataExists;

  DataResult({required super.success, this.data, required super.message}) : super();

  DataResult.success({required this.data, super.message}) : super.success();

  DataResult.successByMessage({required this.data, required super.message}) : super.successByMessage();

  DataResult.error({this.data, required super.message}) : super.error();

  DataResult.errorByEmpty({this.data, super.message}) : super.errorByEmpty();
}
