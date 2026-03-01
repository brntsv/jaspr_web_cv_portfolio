import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component buttonLink({
  required String label,
  required String href,
  required String iconClass,
}) {
  return a(
    [
      span([Component.text(label)], classes: 'button-title'),
      span([], classes: 'icon $iconClass'),
    ],
    href: href,
    classes: 'btn',
  );
}
