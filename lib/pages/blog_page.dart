import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../components/animated_text.dart';
import '../components/button.dart';
import '../components/clickable_text.dart';
import '../components/markdown.dart';
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
              tag: 'h1',
            ),
            animatedTextBlock(
              content.aboutMeBlog,
              appearDuration: 4,
              appearClass: 2,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              tag: 'p',
            ),
            div(
              [
                buttonLink(
                  label: content.cvLabel,
                  href: routeFor(lang, '/cv'),
                  iconClass: 'icon-lightning green',
                ),
                buttonLink(
                  label: content.portfolioLabel,
                  href: routeFor(lang, '/portfolio'),
                  iconClass: 'icon-lightning purple',
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
        h3([
          Component.text(content.projectsTitle),
        ], classes: 'h3'),
        div(
          [
            clickableText(
              title: flour.title,
              description: flour.shortDesc,
              href: portfolioAnchor(lang, 'flour-and-order'),
            ),
            clickableText(
              title: realt.title,
              description: realt.shortDesc,
              href: portfolioAnchor(lang, 'realt-one'),
            ),
            clickableText(
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
        h3([
          Component.text(content.contributingTitle),
        ], classes: 'h3'),
        div(
          [
            markdownText(
              '${content.nativeWebscroll}${content.nativeWebscrollDesc}',
              className: 'base-text',
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
        h3([
          Component.text(content.socialsTitle),
        ], classes: 'h3'),
        div(
          [
            markdownText(content.telegram, className: 'base-text'),
            markdownText(content.linkedin, className: 'base-text'),
            markdownText(content.github, className: 'base-text'),
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
        h3([
          Component.text(content.aboutThisPageTitle),
        ], classes: 'h3'),
        div(
          [
            markdownText(content.blogFooterDesc, className: 'base-text'),
            markdownText(content.blogFooterDesc2, className: 'base-text'),
          ],
          classes: 'stack gap-4 indent',
        ),
      ],
      classes: 'stack gap-12',
    );
  }
}
