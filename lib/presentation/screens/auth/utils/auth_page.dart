import 'package:flutter/material.dart';

import '../../../../utils/enum/auth_type.dart';

abstract class AuthStatefulPage extends StatefulWidget {
  final AuthType authType;

  const AuthStatefulPage({Key? key, required this.authType}) : super(key: key);
}
