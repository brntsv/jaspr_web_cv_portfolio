import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component clickableText({
  required String title,
  required String description,
  required String href,
  String className = 'base-text',
}) {
  return p(
    [
      a(
        [text(title)],
        href: href,
        classes: 'link-inline',
      ),
      text(description),
    ],
    classes: className,
  );
}
