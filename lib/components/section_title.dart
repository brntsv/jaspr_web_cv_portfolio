import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import 'animated_text.dart';

Component sectionTitle(
  String title, {
  int appearClass = 2,
  String wordClass = 'word',
}) {
  return div(
    [
      animatedTextBlock(
        title,
        appearDuration: 3,
        appearClass: appearClass,
        colorVar: 'var(--color-dark-gray)',
        className: 'h2',
        wordClass: wordClass,
        tag: 'h2',
      ),
      div([], classes: 'divider'),
    ],
    classes: 'section-title stack gap-8',
  );
}
