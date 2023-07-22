import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';

import '../../utils/enums/process_status.dart';
import '../../utils/results/data_result.dart';

abstract class ApiResponse<TResponse> extends DataResult<TResponse> {
  @override
  String get message => friendlyMessage?.message ?? '';

  final FriendlyMessageModel? friendlyMessage;

  @override
  bool get success => (processStatus ?? ProcessStatus.undefined) == ProcessStatus.success;

  final ProcessStatus? processStatus;

  ApiResponse({super.data, this.friendlyMessage, this.processStatus})
      : super(
          message: friendlyMessage?.message ?? '',
          success: (processStatus ?? ProcessStatus.undefined) == ProcessStatus.success,
        );
}

mixin ApiResponseJsonKeyMixin<TResponse> on ApiResponse<TResponse> {
  static const String dataKey = 'payload';
  static const String messageKey = 'friendlyMessage';
  static const String statusKey = 'processStatus';
}
