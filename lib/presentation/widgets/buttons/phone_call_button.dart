import 'package:flutter/material.dart';

class PhoneCallButton extends StatelessWidget {
  const PhoneCallButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // #TODO: тут url_launcher, который откроет телефон на телефоне ))
      },
      icon: Image.asset(
        "images/phone.png",
        // #TODO: вообще были ожидания, что компонент сразу будет смотреть цвет темы. Но нет,
        // ни из primaryIconTheme, ни из appBarTheme.iconTheme цвет не берется, пока явно здесь
        // не напишем. А вот размер иконки почему-то берется :/
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
