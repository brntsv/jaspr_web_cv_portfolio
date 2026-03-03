import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component buttonLink({
  required String label,
  required String href,
  required String iconClass,
  List<Component>? labelChildren,
  String className = 'btn',
  Map<String, String>? attributes,
}) {
  return a(
    [
      span(labelChildren ?? [Component.text(label)], classes: 'button-title'),
      span([], classes: 'icon $iconClass'),
    ],
    href: href,
    classes: className,
    attributes: attributes,
  );
}
