import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color maincolor = const Color(0xFF000633);
  // ignore: use_full_hex_values_for_flutter_colors
  static Color accentColor = const Color(0xFF00065FF);
  static Color bgcolor = const Color(0XFFe2e2ee);

  static List<Color> cardColors = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.yellow.shade100,
    Colors.grey.shade100
  ];

  static TextStyle maintitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle maincontent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500);
}
