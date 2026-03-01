import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../data/content.dart';
import 'language_switcher.dart';
import 'back_button.dart';

class PageShell extends StatelessComponent {
  const PageShell({
    required this.lang,
    required this.currentPath,
    required this.child,
    this.showBackButton = false,
    this.backHref = '/',
    super.key,
  });

  final Lang lang;
  final String currentPath;
  final Component child;
  final bool showBackButton;
  final String backHref;

  @override
  Component build(BuildContext context) {
    return div(
      [
        languageSwitcher(lang: lang, currentPath: currentPath),
        if (showBackButton) backButton(href: backHref),
        child,
      ],
      classes: 'page-shell',
    );
  }
}
