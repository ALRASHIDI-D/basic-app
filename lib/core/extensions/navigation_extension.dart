import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  push(String routeName, {Map<String, dynamic>? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  pushRemovement(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  pushReplacement(String routeName, {Map<String, dynamic>? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  pop([dynamic result]) {
    if (Navigator.canPop(this)) {
      Navigator.pop(this, result);
    } else {}
  }
}
