import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../data/content.dart';

Component languageSwitcher({
  required Lang lang,
  required String currentPath,
}) {
  final isRu = lang == Lang.ru;
  final label = isRu ? 'EN' : 'RU';
  final target = _togglePath(currentPath);

  return a(
    [Component.text(label)],
    href: target,
    classes: 'lang-switcher',
  );
}

String _togglePath(String path) {
  if (path.startsWith('/en')) {
    final rest = path.substring(3);
    return rest.isEmpty ? '/' : rest;
  }
  return path == '/' ? '/en' : '/en$path';
}
