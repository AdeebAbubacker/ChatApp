import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final rubik = GoogleFonts.rubik();
  static final ibmmono = GoogleFonts.ibmPlexMono();

  // Naming convention: [fontFamily]_[fontSize]_[color]_[fontWeight]

  static final TextStyle rubik16grey66 = rubik.copyWith(
    fontSize: 15,
    color: const Color(0xFF666666),
  );
  static final TextStyle rubik12grey66 = rubik.copyWith(
    fontSize: 12,
    color: const Color(0xFF666666),
  );
}
