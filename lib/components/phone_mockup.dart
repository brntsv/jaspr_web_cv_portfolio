import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

Component phoneMockup(List<String> screenshots) {
  final hasDots = screenshots.length > 1;
  return div(
    [
      div(
        [
          div(
            [
              div(
                [
                  for (final shot in screenshots)
                    img(
                      src: shot,
                      classes: 'phone-shot',
                      attributes: const {'loading': 'lazy'},
                    ),
                ],
                classes: 'phone-track',
              ),
            ],
            classes: 'phone-screen',
          ),
        ],
        classes: 'phone-frame',
      ),
      if (hasDots)
        div(
          [
            div(
              [
                for (var i = 0; i < screenshots.length; i++)
                  span([], classes: 'dot${i == 0 ? ' active' : ''}'),
              ],
              classes: 'dots-track',
            ),
          ],
          classes: 'dots',
        ),
    ],
    classes: 'phone',
    attributes: {
      'data-slide-count': '${screenshots.length}',
      'data-slide-interval': '10000',
      'data-slide-pause': '10000',
    },
  );
}
