import 'package:abc12/provider/share_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ColorTogglerPage extends StatelessWidget {
  void _toggleColor(BuildContext context) {
    Provider.of<ColorToggler>(context, listen: false).toggleColor();
  }

  @override
  Widget build(BuildContext context) {
    var isRed = Provider.of<ColorToggler>(context).isRed;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isRed ? Colors.red : Colors.indigo,
      ),
      onPressed: () => _toggleColor(context),
      child: const Text('Change my Color!'),
    );
  }
}
