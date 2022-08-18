import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// copy-pasted from flutter-gallery sample app
class ThemeConsts {
  static ThemeData lightThemeData = themeData(lightColorScheme,
      Colors.black.withOpacity(0.12), Colors.black.withOpacity(0.6));
  static ThemeData darkThemeData = themeData(
      darkColorScheme, Colors.white.withOpacity(0.12), Colors.white60);

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, Color hintColor) {
    final IconThemeData iconThemeData =
        IconThemeData(color: colorScheme.onPrimary, size: 30);

    return ThemeData(
        colorScheme: colorScheme,
        textTheme: _textTheme,
        // Matches manifest.json colors and background color.
        primaryColor: const Color(0xFF030303),
        hintColor: hintColor,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          elevation: 5,
          iconTheme: iconThemeData,
          titleTextStyle: TextStyle(
              fontFamily: "ABeeZee",
              fontSize: 20,
              color: colorScheme.onPrimary),
        ),
        iconTheme: iconThemeData,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.alphaBlend(
            Colors.black.withOpacity(0.80),
            Colors.white,
          ),
          contentTextStyle: _textTheme.subtitle1!.apply(color: Colors.white),
        ),
        floatingActionButtonTheme: _floatingActionButtonTheme,
        cardTheme: _cardTheme,
        checkboxTheme: _checkboxThemeData);
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    // в голубеньких тонах
    primary: Colors.blue,
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Colors.white, // Color(0xFFF2F2F2),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.black,
    onError: Colors.black,
    onPrimary: Colors.black54,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.blue,
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    // White with 0.05 opacity
    onBackground: Color(0x0DFFFFFF),
    error: Colors.white,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonTheme =
      FloatingActionButtonThemeData(
          sizeConstraints: BoxConstraints.tightFor(
            width: 48.0,
            height: 48.0,
          ),
          smallSizeConstraints: BoxConstraints.tightFor(
            width: 48.0,
            height: 48.0,
          ),
          largeSizeConstraints: BoxConstraints.tightFor(
            width: 48.0,
            height: 48.0,
          ),
          extendedSizeConstraints: BoxConstraints.tightFor(
            height: 48.0,
          ));

  static const CardTheme _cardTheme = CardTheme(elevation: 2);

  static final CheckboxThemeData _checkboxThemeData = CheckboxThemeData(
      fillColor: MaterialStateProperty.all(const Color(0xFF646363)));
}
