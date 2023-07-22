import 'token_context.dart';

class ApiTokenContext extends TokenContext {
  ApiTokenContext() : super();

  @override
  DateTime convertStringToDateTime(String? dateString, {DateTime? defaultDate, int defaultYear = 1}) {
    try {
      final date = DateTime.parse(dateString ?? '');
      return date;
    } catch (_) {
      return defaultDate ?? DateTime(defaultYear);
    }
  }
}
