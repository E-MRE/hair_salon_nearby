import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/enums/state_status.dart';

extension StateStatusExtensions on ProcessStatus {
  StateStatus toStateStatus() {
    return this == ProcessStatus.success ? StateStatus.success : StateStatus.error;
  }
}
