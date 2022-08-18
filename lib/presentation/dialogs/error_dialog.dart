import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> lastMessages = [];

void initializeLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    // Простейшая подготовка отчета об ошибке:
    // писать последние 100 event`ов
    // при нажатии кнопки отчета об ошибке открывать отправку почты support`у
    // скидывать туда 100 последних записей в логе и стек исключения.
    const String delim = " ";
    String message = event.sequenceNumber.toString() +
        delim +
        event.time.toString() +
        delim +
        event.level.toString() +
        delim +
        "[" +
        event.loggerName +
        "]" +
        delim +
        event.message +
        delim +
        (event.stackTrace != null ? event.stackTrace.toString() : "") +
        delim +
        (event.error != null ? event.error.toString() : "");
    print(message);
    lastMessages.add(message);
    if (lastMessages.length > 100) {
      lastMessages.removeAt(0);
    }
  });
}

void showErrorReportDialog() {
  Get.defaultDialog(
    title: "Сообщить об ошибке",
    content: SizedBox(
      height: 500,
      child: SelectableText.rich(TextSpan(
          text: lastMessages.map((e) {
        return "\n" + e.toString();
      }).toString())),
    ),
    actions: <Widget>[
      TextButton(
        child: const Text('Отправить'),
        onPressed: () {
          // #TODO: пробрасывать ServerName или DBName сервера или каую-то такую инфу. Ее же неплохо бы
          // #TODO: фиксировать имя учетной записи и время отправки
          // #TODO: мб телеграм ссылку? мб сделать чтобы настраивалось?
          // наверное, так
          String subject = "version DBName/instance date error.name";
          String body =
              "*********************************************************************\n" +
                  lastMessages.toString() +
                  "\n" +
                  "*********************************************************************\n";

          String url =
              "mailto:support@kostd.org?subject=" + subject + "&body=" + body;
          final String encodedURl = Uri.encodeFull(url);
          launch(encodedURl);
        },
      ),
      TextButton(
        child: const Text('Отмена'),
        onPressed: () {
          GetDelegate routerDelegate = Get.find();
          routerDelegate.popRoute();
        },
      ),
    ],
  );
}
