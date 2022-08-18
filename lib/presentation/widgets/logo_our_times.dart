import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

/// Логотип заведения "Наше время"
class LogoOurTimes extends StatelessWidget {
  const LogoOurTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: Image.asset("images/skyscraper.png",
                  height: 35, color: Theme.of(context).colorScheme.onPrimary)),
          TextSpan(
            text: " Наше время ",
            style: CyrillicFonts.badScript(
              fontSize: 28,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
