import 'token_context.dart';

class ApiTokenContext extends TokenContext {
  ApiTokenContext() : super();

  @override
  DateTime convertStringToDateTime(String? dateString) {
    try {
      final date = DateTime.parse(dateString ?? tokenDateFormat);
      return date;
    } catch (_) {
      return DateTime(1);
    }
  }
}
