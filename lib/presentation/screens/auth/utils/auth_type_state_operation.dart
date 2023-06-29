import 'package:flutter/material.dart';

import '../../../../utils/enum/auth_type.dart';
import 'auth_page.dart';

mixin AuthTypeStateOperationMixin<T extends AuthStatefulPage> on State<T> {
  late AuthType authType;

  @override
  void initState() {
    super.initState();
    selectAuthType(widget.authType);
  }

  void selectAuthType(AuthType authType) {
    setState(() {
      this.authType = authType;
    });
  }
}
