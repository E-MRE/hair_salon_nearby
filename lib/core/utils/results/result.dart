///Simple result class that includes operation status [success] and operation message [message].
///It's useful for returning operation result and message together.
///
///Simple example:
///
///```dart
///Future<Result> validateUser(UserModel user) async {
///   final isValid = await _service.validate(user);
///   return isValid ? Result.success() : Result.error(message: 'User is not valid!');
///}
///```
class Result {
  final bool success;
  final String message;

  bool get isNotSuccess => !success;

  Result({required this.success, required this.message});

  Result.success({this.message = ''}) : success = true;

  Result.successByMessage({required this.message}) : success = true;

  Result.error({required this.message}) : success = false;

  Result.errorByEmpty({this.message = ''}) : success = false;
}
