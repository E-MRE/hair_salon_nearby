import 'token_controller.dart';

class ApiTokenController extends TokenController {
  ApiTokenController() : super();

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
