import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import 'markdown.dart';

Component bulletList(
  List<String> items, {
  String className = 'bullet-list',
}) {
  return ul(
    [
      for (final item in items)
        li(
          [
            span([Component.text('—')], classes: 'bullet'),
            span([
              markdownText(item, className: 'bullet-text', tag: 'span'),
            ], classes: 'bullet-content'),
          ],
          classes: 'bullet-item',
        ),
    ],
    classes: className,
  );
}
