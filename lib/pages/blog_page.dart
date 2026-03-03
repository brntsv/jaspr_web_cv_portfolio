import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../components/animated_text.dart';
import '../components/button.dart';
import '../data/content.dart';
import '../data/routes.dart';

class BlogPage extends StatelessComponent {
  const BlogPage({
    required this.content,
    required this.lang,
    super.key,
  });

  final AppContent content;
  final Lang lang;

  @override
  Component build(BuildContext context) {
    return div(
      [
        div(
          [
            animatedTextBlock(
              content.yourName,
              appearDuration: 3,
              appearClass: 20,
              colorVar: 'var(--color-dark-gray)',
              className: 'h1',
              wordClass: 'word-fade',
              tag: 'h1',
            ),
            animatedTextBlock(
              content.aboutMeBlog,
              appearDuration: 4,
              appearClass: 2,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              wordClass: 'word-fade',
              tag: 'p',
            ),
            div(
              [
                buttonLink(
                  label: content.cvLabel,
                  href: routeFor(lang, '/cv'),
                  iconClass: 'icon-lightning green',
                  labelChildren: animatedWords(
                    content.cvLabel,
                    appearDuration: 4,
                    appearClass: 5,
                    colorVar: 'var(--color-white)',
                    wordClass: 'word-fade',
                    startIndex: 6,
                  ),
                  className: 'btn word-fade',
                  attributes: {
                    'style': _wordFadeStyle(
                      6,
                      appearDuration: 4,
                      appearClass: 5,
                      colorVar: 'var(--color-white)',
                    ),
                  },
                ),
                buttonLink(
                  label: content.portfolioLabel,
                  href: routeFor(lang, '/portfolio'),
                  iconClass: 'icon-lightning purple',
                  labelChildren: animatedWords(
                    content.portfolioLabel,
                    appearDuration: 4,
                    appearClass: 7,
                    colorVar: 'var(--color-white)',
                    wordClass: 'word-fade',
                    startIndex: 12,
                  ),
                  className: 'btn word-fade',
                  attributes: {
                    'style': _wordFadeStyle(
                      12,
                      appearDuration: 4,
                      appearClass: 7,
                      colorVar: 'var(--color-white)',
                    ),
                  },
                ),
              ],
              classes: 'row gap-16',
            ),
            _projectsSection(),
            _contributingSection(),
            _socialsSection(),
            _aboutSection(),
          ],
          classes: 'stack gap-32',
        ),
      ],
      classes: 'page blog',
    );
  }

  Component _projectsSection() {
    final flour = content.projectStrings[ProjectId.flourAndOrder]!;
    final realt = content.projectStrings[ProjectId.realtOne]!;
    final novex = content.projectStrings[ProjectId.novex]!;

    return div(
      [
        animatedTextBlock(
          content.projectsTitle,
          appearDuration: 3,
          appearClass: 6,
          colorVar: 'var(--color-dark-gray)',
          className: 'h3',
          wordClass: 'word-fade',
          tag: 'h3',
        ),
        div(
          [
            _animatedClickableText(
              title: flour.title,
              description: flour.shortDesc,
              href: portfolioAnchor(lang, 'flour-and-order'),
            ),
            _animatedClickableText(
              title: realt.title,
              description: realt.shortDesc,
              href: portfolioAnchor(lang, 'realt-one'),
            ),
            _animatedClickableText(
              title: novex.title,
              description: novex.shortDesc,
              href: portfolioAnchor(lang, 'novex'),
            ),
          ],
          classes: 'stack gap-4 indent',
        ),
      ],
      classes: 'stack gap-12',
    );
  }

  Component _contributingSection() {
    return div(
      [
        animatedTextBlock(
          content.contributingTitle,
          appearDuration: 3,
          appearClass: 8,
          colorVar: 'var(--color-dark-gray)',
          className: 'h3',
          wordClass: 'word-fade',
          tag: 'h3',
        ),
        div(
          [
            animatedMarkdownBlock(
              '${content.nativeWebscroll}${content.nativeWebscrollDesc}',
              appearDuration: 4,
              appearClass: 2,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
            ),
          ],
          classes: 'stack gap-4 indent',
        ),
      ],
      classes: 'stack gap-12',
    );
  }

  Component _socialsSection() {
    return div(
      [
        animatedTextBlock(
          content.socialsTitle,
          appearDuration: 3,
          appearClass: 4,
          colorVar: 'var(--color-dark-gray)',
          className: 'h3',
          wordClass: 'word-fade',
          tag: 'h3',
        ),
        div(
          [
            animatedMarkdownBlock(
              content.telegram,
              appearDuration: 4,
              appearClass: 1,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
            ),
            animatedMarkdownBlock(
              content.linkedin,
              appearDuration: 4,
              appearClass: 3,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
            ),
            animatedMarkdownBlock(
              content.github,
              appearDuration: 4,
              appearClass: 5,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
            ),
          ],
          classes: 'stack gap-4 indent',
        ),
      ],
      classes: 'stack gap-12',
    );
  }

  Component _aboutSection() {
    return div(
      [
        animatedTextBlock(
          content.aboutThisPageTitle,
          appearDuration: 3,
          appearClass: 9,
          colorVar: 'var(--color-dark-gray)',
          className: 'h3',
          wordClass: 'word-fade',
          tag: 'h3',
        ),
        div(
          [
            animatedMarkdownBlock(
              content.blogFooterDesc,
              appearDuration: 4,
              appearClass: 2,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
            ),
          ],
          classes: 'stack gap-4 indent',
        ),
      ],
      classes: 'stack gap-12',
    );
  }

  Component _animatedClickableText({
    required String title,
    required String description,
    required String href,
  }) {
    return animatedMarkdownBlock(
      '[${title}](${href}) ${description}',
      appearDuration: 4,
      appearClass: 2,
      textColorVar: 'var(--color-dark-gray)',
      linkColorVar: 'var(--color-blue)',
      className: 'base-text',
      wordClass: 'word-fade',
    );
  }

  String _wordFadeStyle(
    int itemIndex, {
    double appearDuration = 4,
    int appearClass = 2,
    required String colorVar,
  }) {
    final animationClass = _getAnimationClass(itemIndex, appearClass);
    final start = 0.02 + (animationClass / 100);
    final end = 0.30 + (animationClass / 100);
    final delay = appearDuration * start;
    final duration = appearDuration * (end - start);
    return '--word-delay:${delay.toStringAsFixed(3)}s;'
        '--word-duration:${duration.toStringAsFixed(3)}s;'
        '--word-color:$colorVar;';
  }

  int _getAnimationClass(int itemIndex, int baseClassNum) {
    final hashValue = (itemIndex * 17 + baseClassNum * 13) % 20;
    return hashValue + 1;
  }
}
