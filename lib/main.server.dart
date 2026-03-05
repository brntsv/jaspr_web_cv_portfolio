import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Никита Баранцев',
      base: '/',
      charset: 'utf-8',
      meta: {
        'viewport': 'width=device-width, initial-scale=1',
        'description': 'Flutter Developer',
        'mobile-web-app-capable': 'yes',
        'apple-mobile-web-app-status-bar-style': 'black',
        'apple-mobile-web-app-title': 'Никита Баранцев',
        'analytics-domain': '',
      },
      head: [
        meta(httpEquiv: 'X-UA-Compatible', content: 'IE=edge'),
        link(rel: 'apple-touch-icon', href: '/icons/Icon-192.png'),
        link(rel: 'icon', type: 'image/png', href: '/favicon.png'),
        link(rel: 'manifest', href: '/manifest.json'),
        link(rel: 'stylesheet', href: '/styles.css'),
        script(src: '/phone_autoplay.js', defer: true),
        script(src: '/lang_switcher_scroll.js', defer: true),
        script(src: '/analytics.js', defer: true),
      ],
      body: const App(),
    ),
  );
}
