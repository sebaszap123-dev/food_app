import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color toColor() {
    final colorNames = <String, Color>{
      'red': Colors.red,
      'orange': Colors.orange,
      // Agrega otros colores aquí
    };

    if (colorNames.containsKey(this)) {
      return colorNames[this]!;
    }

    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension HexExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).substring(2)}';
  }
}
