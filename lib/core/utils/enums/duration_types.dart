///Default durations for projects.
///
///* zero = 0 seconds
///
///* eightSeconds = 8 seconds
///
/// * sixteenSeconds = 16 seconds
///
/// * thirtytwoSeconds =  32 seconds
///
/// * sixtySeconds = 60 seconds
///
/// * twoMinutes = 2 minutes
///
/// * fourMinutes = 4 minutes
///
/// * sixMinutes = 6 minutes
///
/// * tenMinutes = 10 minutes
///
/// * twentyMinutes = 20 minutes
///
/// * thirtyMinutes = 30 minutes
///
/// * sixtyMinutes = 60 minutes
///
enum DurationTypes {
  /// value = 0 seconds
  zero,

  /// value = 8 seconds
  eightSeconds,

  /// value = 16 seconds
  sixteenSeconds,

  /// value = 32 seconds
  thirtytwoSeconds,

  /// value = 60 seconds
  sixtySeconds,

  /// value = 2 minutes
  twoMinutes,

  /// value = 4 minutes
  fourMinutes,

  /// value = 6 minutes
  sixMinutes,

  /// value = 10 minutes
  tenMinutes,

  /// value = 20 minutes
  twentyMinutes,

  /// value = 30 minutes
  thirtyMinutes,

  /// value = 60 minutes
  sixtyMinutes,
}

extension DurationTypesExtension on DurationTypes {
  Duration rawValue() {
    switch (this) {
      case DurationTypes.zero:
        return const Duration(seconds: 0);
      case DurationTypes.eightSeconds:
        return const Duration(seconds: 8);
      case DurationTypes.sixteenSeconds:
        return const Duration(seconds: 16);
      case DurationTypes.thirtytwoSeconds:
        return const Duration(seconds: 32);
      case DurationTypes.sixtySeconds:
        return const Duration(seconds: 60);
      case DurationTypes.twoMinutes:
        return const Duration(minutes: 2);
      case DurationTypes.fourMinutes:
        return const Duration(minutes: 4);
      case DurationTypes.sixMinutes:
        return const Duration(minutes: 6);
      case DurationTypes.tenMinutes:
        return const Duration(minutes: 10);
      case DurationTypes.twentyMinutes:
        return const Duration(minutes: 20);
      case DurationTypes.thirtyMinutes:
        return const Duration(minutes: 30);
      case DurationTypes.sixtyMinutes:
        return const Duration(minutes: 60);
    }
  }
}
