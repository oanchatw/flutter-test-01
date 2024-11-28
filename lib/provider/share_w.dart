import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ColorToggler extends ChangeNotifier {
  bool _isRed = true;
  bool get isRed => _isRed;

  void toggleColor() {
    _isRed = !_isRed;
    notifyListeners();
  }
}
