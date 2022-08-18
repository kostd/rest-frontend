import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

/// highlight (text с фичей особого выделения фрагмента текста) с ограничением по ширине
/// полезен в карточках.
class TightHighlight extends StatelessWidget {
  final String text;
  final String term;
  final double? width;
  final TextStyle? textStyle;
  final TextStyle? textStyleHighlight;
  final int? maxLines;

  const TightHighlight(
      {Key? key,
      required this.text,
      required this.term,
      this.width,
      this.textStyle,
      this.textStyleHighlight,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width ?? MediaQuery.of(context).size.width * 0.6,
      ),
      child: SubstringHighlight(
        text: text,
        term: term,
        textStyle: textStyle ??
            TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        textStyleHighlight: textStyleHighlight ??
            TextStyle(color: Theme.of(context).colorScheme.primary),
        maxLines: maxLines ?? 20,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
