import 'content.dart';

String routeFor(Lang lang, String path) {
  if (lang == Lang.en) {
    return path == '/' ? '/en' : '/en$path';
  }
  return path;
}

String portfolioAnchor(Lang lang, String anchor) {
  final base = routeFor(lang, '/portfolio');
  return '$base#$anchor';
}
