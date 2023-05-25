enum StateStatus { initial, loading, success, error }

extension StateStatusBooleanExtension on bool {
  StateStatus toStateStatus() {
    return this ? StateStatus.success : StateStatus.error;
  }
}
