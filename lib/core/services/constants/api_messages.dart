// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';

class ApiMessages {
  static ApiMessages? _instance;
  static ApiMessages get instance {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ApiMessages._init();
    return _instance!;
  }

  late final String FETCH_DATA_ERROR;
  late final String POST_DATA_ERROR;
  late final String OPERATION_FAILED;
  late final String OPERATION_SUCCESSFUL;

  late final String BAD_REQUEST;
  late final String UNAUTHORIZED;
  late final String FORBIDDEN;
  late final String NOT_FOUND;
  late final String INTERNAL_SERVER_ERROR;
  late final String NETWORK_ERROR;
  late final String TIMEOUT_ERROR;

  ApiMessages._init() {
    FETCH_DATA_ERROR = LocaleKeys.apiMessage_fetchError.tr();
    POST_DATA_ERROR = LocaleKeys.apiMessage_postError.tr();
    OPERATION_FAILED = LocaleKeys.apiMessage_failed.tr();
    OPERATION_SUCCESSFUL = LocaleKeys.apiMessage_successful.tr();

    BAD_REQUEST = LocaleKeys.apiMessage_badRequest.tr();
    UNAUTHORIZED = LocaleKeys.apiMessage_unauthorized.tr();
    FORBIDDEN = LocaleKeys.apiMessage_forbidden.tr();
    NOT_FOUND = LocaleKeys.apiMessage_notFound.tr();
    INTERNAL_SERVER_ERROR = LocaleKeys.apiMessage_internalServerError.tr();
    NETWORK_ERROR = LocaleKeys.apiMessage_connectionError.tr();
    TIMEOUT_ERROR = LocaleKeys.apiMessage_timeoutError.tr();
  }
}
