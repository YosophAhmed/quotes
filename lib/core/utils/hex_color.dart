import 'dart:ui';

class HexColor extends Color {
  HexColor(
    final String hexColor,
  ) : super(_getColorFromHex(
          hexColor: hexColor,
        ));

  static int _getColorFromHex({
    required String hexColor,
  }) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
