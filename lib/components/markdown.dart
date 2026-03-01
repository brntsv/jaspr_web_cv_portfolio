import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component markdownText(
  String text, {
  required String className,
  String tag = 'p',
}) {
  final children = _markdownInline(text);
  switch (tag) {
    case 'span':
      return span(children, classes: className);
    default:
      return p(children, classes: className);
  }
}

List<Component> _markdownInline(String text) {
  final spans = <Component>[];
  final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
  var lastMatchEnd = 0;

  for (final match in linkRegex.allMatches(text)) {
    if (match.start > lastMatchEnd) {
      final before = text.substring(lastMatchEnd, match.start);
      if (before.isNotEmpty) {
        spans.add(textNode(before));
      }
    }

    final linkText = match.group(1) ?? '';
    final linkUrl = match.group(2) ?? '';
    spans.add(
      a(
        [textNode(linkText)],
        href: linkUrl,
        attributes: const {
          'target': '_blank',
          'rel': 'noopener',
        },
        classes: 'link-inline',
      ),
    );

    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    final after = text.substring(lastMatchEnd);
    if (after.isNotEmpty) {
      spans.add(textNode(after));
    }
  }

  return spans;
}

Component textNode(String value) => Component.text(value);
