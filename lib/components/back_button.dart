import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component backButton({String href = '/'}) {
  return a(
    [span([], classes: 'icon icon-back')],
    href: href,
    classes: 'back-button',
  );
}
