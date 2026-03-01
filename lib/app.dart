import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/page_shell.dart';
import 'data/content.dart';
import 'pages/blog_page.dart';
import 'pages/cv_page.dart';
import 'pages/portfolio_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(
          path: '/',
          builder: (context, state) => PageShell(
            lang: Lang.ru,
            currentPath: '/',
            child: BlogPage(content: contentRu, lang: Lang.ru),
          ),
        ),
        Route(
          path: '/cv',
          builder: (context, state) => PageShell(
            lang: Lang.ru,
            currentPath: '/cv',
            showBackButton: true,
            backHref: '/',
            child: CvPage(content: contentRu, lang: Lang.ru),
          ),
        ),
        Route(
          path: '/portfolio',
          builder: (context, state) => PageShell(
            lang: Lang.ru,
            currentPath: '/portfolio',
            showBackButton: true,
            backHref: '/',
            child: PortfolioPage(content: contentRu, lang: Lang.ru),
          ),
        ),
        Route(
          path: '/en',
          builder: (context, state) => PageShell(
            lang: Lang.en,
            currentPath: '/en',
            child: BlogPage(content: contentEn, lang: Lang.en),
          ),
        ),
        Route(
          path: '/en/cv',
          builder: (context, state) => PageShell(
            lang: Lang.en,
            currentPath: '/en/cv',
            showBackButton: true,
            backHref: '/en',
            child: CvPage(content: contentEn, lang: Lang.en),
          ),
        ),
        Route(
          path: '/en/portfolio',
          builder: (context, state) => PageShell(
            lang: Lang.en,
            currentPath: '/en/portfolio',
            showBackButton: true,
            backHref: '/en',
            child: PortfolioPage(content: contentEn, lang: Lang.en),
          ),
        ),
      ],
    );
  }
}
