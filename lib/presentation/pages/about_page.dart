import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rest_frontend/presentation/widgets/reflowing_scaffold.dart';

import '../widgets/buttons/cancel_button.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = 'about';

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ReflowingScaffold(
      appBar: AppBar(
        title: Text(
          "О приложении",
          style: CyrillicFonts.badScript(
            fontSize: 28,
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        titleSpacing: 0.0,
        // если leading оставить пустым, будет отображаться стандартная иконка меню, которая нам не нужна
        leading: const Text(""),
        actions: const [CancelButton()],
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(child: Row(), flex: 2),
        Expanded(
          child: PhotoView(
              imageProvider: const AssetImage(
                "images/city.png",
                //  bundle: rootBundle,
              ),
              initialScale: PhotoViewComputedScale.contained * 0.7,
              maxScale: PhotoViewComputedScale.contained * 0.9,
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent)),
        ),
        Text(
          "Ресторан Наше Время",
          style: CyrillicFonts.badScript(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(
          child: Text("@author: kostd"),
        ),
      ]),
    );
  }
}
