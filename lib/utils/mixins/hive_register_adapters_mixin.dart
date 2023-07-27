import 'package:hive_flutter/hive_flutter.dart';

import '../../core/services/constants/hive_constants.dart';
import '../../core/services/models/token_model.dart';

mixin HiveRegisterAdaptersMixin {
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.token)) {
      Hive.registerAdapter<TokenModel>(TokenModelAdapter());
    }
  }
}
