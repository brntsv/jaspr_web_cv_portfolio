import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

List<Component> animatedWords(
  String text, {
  required double appearDuration,
  required int appearClass,
  required String colorVar,
  String wordClass = 'word',
  int startIndex = 0,
}) {
  final words = text.split(' ');
  final components = <Component>[];
  for (var i = 0; i < words.length; i++) {
    final wordIndex = startIndex + i;
    final isLast = i == words.length - 1;
    components.add(
      _animatedWord(
        '${words[i]}${isLast ? '' : ' '}',
        wordIndex: wordIndex,
        appearClass: appearClass,
        appearDuration: appearDuration,
        colorVar: colorVar,
        wordClass: wordClass,
      ),
    );
  }
  return components;
}

Component animatedTextBlock(
  String text, {
  required double appearDuration,
  required int appearClass,
  required String colorVar,
  required String className,
  String wordClass = 'word',
  String tag = 'p',
}) {
  final children = animatedWords(
    text,
    appearDuration: appearDuration,
    appearClass: appearClass,
    colorVar: colorVar,
    wordClass: wordClass,
  );

  return _wrapTag(tag, children, className: className);
}

Component animatedMarkdownBlock(
  String text, {
  required double appearDuration,
  required int appearClass,
  required String textColorVar,
  required String linkColorVar,
  required String className,
  String wordClass = 'word',
  String tag = 'p',
}) {
  final children = animatedMarkdown(
    text,
    appearDuration: appearDuration,
    appearClass: appearClass,
    textColorVar: textColorVar,
    linkColorVar: linkColorVar,
    wordClass: wordClass,
  );
  return _wrapTag(tag, children, className: className);
}

List<Component> animatedMarkdown(
  String text, {
  required double appearDuration,
  required int appearClass,
  required String textColorVar,
  required String linkColorVar,
  String wordClass = 'word',
}) {
  final spans = <Component>[];
  final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
  var lastMatchEnd = 0;
  var wordIndex = 0;

  for (final match in linkRegex.allMatches(text)) {
    if (match.start > lastMatchEnd) {
      final before = text.substring(lastMatchEnd, match.start);
      if (before.isNotEmpty) {
        final words = before.split(' ');
        for (var i = 0; i < words.length; i++) {
          final isLastWord = i == words.length - 1;
          spans.add(
            _animatedWord(
              '${words[i]}${isLastWord ? '' : ' '}',
              wordIndex: wordIndex + i,
              appearClass: appearClass,
              appearDuration: appearDuration,
              colorVar: textColorVar,
              wordClass: wordClass,
            ),
          );
        }
        wordIndex += words.length;
      }
    }

    final linkText = match.group(1) ?? '';
    final linkUrl = match.group(2) ?? '';
    final linkWords = linkText.split(' ');
    final linkChildren = <Component>[];

    for (var i = 0; i < linkWords.length; i++) {
      final isLastWord = i == linkWords.length - 1;
      linkChildren.add(
        _animatedWord(
          '${linkWords[i]}${isLastWord ? '' : ' '}',
          wordIndex: wordIndex + i,
          appearClass: appearClass,
          appearDuration: appearDuration,
          colorVar: linkColorVar,
          wordClass: wordClass,
        ),
      );
    }

    spans.add(
      a(
        linkChildren,
        href: linkUrl,
        attributes: const {
          'target': '_blank',
          'rel': 'noopener',
        },
        classes: 'link-inline',
      ),
    );

    wordIndex += linkWords.length;
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    final after = text.substring(lastMatchEnd);
    if (after.isNotEmpty) {
      final words = after.split(' ');
      for (var i = 0; i < words.length; i++) {
        final isLastWord = i == words.length - 1;
        spans.add(
          _animatedWord(
            '${words[i]}${isLastWord ? '' : ' '}',
            wordIndex: wordIndex + i,
            appearClass: appearClass,
            appearDuration: appearDuration,
            colorVar: textColorVar,
            wordClass: wordClass,
          ),
        );
      }
    }
  }

  return spans;
}

Component _animatedWord(
  String word, {
  required int wordIndex,
  required int appearClass,
  required double appearDuration,
  required String colorVar,
  required String wordClass,
}) {
  final animationClass = _getAnimationClass(wordIndex, appearClass);
  final timing = _getAnimationTiming(animationClass);
  final delay = appearDuration * timing.start;
  final duration = appearDuration * (timing.end - timing.start);

  return span(
    [Component.text(word)],
    classes: wordClass,
    attributes: {
      'style':
          '--word-delay:${delay.toStringAsFixed(3)}s;--word-duration:${duration.toStringAsFixed(3)}s;--word-color:$colorVar;',
    },
  );
}

int _getAnimationClass(int wordIndex, int baseClassNum) {
  final hashValue = (wordIndex * 17 + baseClassNum * 13) % 20;
  return hashValue + 1;
}

_AnimTiming _getAnimationTiming(int animationClass) {
  final start = 0.02 + (animationClass / 100);
  final end = 0.30 + (animationClass / 100);
  return _AnimTiming(start, end);
}

class _AnimTiming {
  const _AnimTiming(this.start, this.end);

  final double start;
  final double end;
}

Component _wrapTag(
  String tag,
  List<Component> children, {
  required String className,
}) {
  switch (tag) {
    case 'h1':
      return h1(children, classes: className);
    case 'h2':
      return h2(children, classes: className);
    case 'h3':
      return h3(children, classes: className);
    case 'h4':
      return h4(children, classes: className);
    case 'span':
      return span(children, classes: className);
    default:
      return p(children, classes: className);
  }
}
