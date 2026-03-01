import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../components/bullet_list.dart';
import '../components/markdown.dart';
import '../components/phone_mockup.dart';
import '../data/content.dart';

class PortfolioPage extends StatelessComponent {
  const PortfolioPage({
    required this.content,
    required this.lang,
    super.key,
  });

  final AppContent content;
  final Lang lang;

  @override
  Component build(BuildContext context) {
    final projects = <ProjectId>[
      ProjectId.flourAndOrder,
      ProjectId.realtOne,
      ProjectId.novex,
    ];

    return div(
      [
        for (var i = 0; i < projects.length; i++)
          _projectSection(projects[i], i),
      ],
      classes: 'portfolio',
    );
  }

  Component _projectSection(ProjectId id, int index) {
    final projectText = content.projectStrings[id]!;
    final assets = projectAssets[id]!;
    final isEven = index.isEven;

    return div(
      [
        div(
          [
            _descriptionSection(id, projectText, assets),
            _mockupSection(assets),
          ],
          classes: 'project-grid${isEven ? '' : ' reverse'}',
        ),
      ],
      classes: 'project-section',
      id: _projectAnchor(id),
    );
  }

  Component _descriptionSection(
    ProjectId id,
    ProjectStrings textData,
    ProjectAssets assets,
  ) {
    final badges = _badgesForProject(assets, lang);

    return div(
      [
        div(
          [
            img(
              src: assets.iconPath,
              classes: 'project-icon',
              attributes: const {'loading': 'lazy'},
            ),
            h4([text(textData.title)], classes: 'h4'),
          ],
          classes: 'row gap-16',
        ),
        div(
          [
            markdownText(
              textData.descriptionIntro,
              className: 'base-text-desc',
            ),
            bulletList(textData.descriptionItems, className: 'bullet-list desc'),
          ],
          classes: 'stack gap-16',
        ),
        if (badges.isNotEmpty)
          div(
            [
              for (final badge in badges)
                a(
                  [img(src: badge.imageUrl, classes: 'store-badge')],
                  href: badge.linkUrl,
                  attributes: const {
                    'target': '_blank',
                    'rel': 'noopener',
                  },
                ),
            ],
            classes: 'badge-wrap',
          ),
      ],
      classes: 'project-description stack gap-32',
    );
  }

  Component _mockupSection(ProjectAssets assets) {
    return div(
      [
        phoneMockup(assets.screenshots),
      ],
      classes: 'project-mockup',
      attributes: {
        'style': 'background-color: ${assets.backgroundColor};',
      },
    );
  }

  List<_StoreBadge> _badgesForProject(ProjectAssets assets, Lang lang) {
    final badges = <_StoreBadge>[];
    final links = assets.storeLinks;

    if (links.appStore != null) {
      badges.add(_StoreBadge(
        imageUrl: storeBadgePath(StoreType.appStore, lang),
        linkUrl: links.appStore!,
      ));
    }
    if (links.googlePlay != null) {
      badges.add(_StoreBadge(
        imageUrl: storeBadgePath(StoreType.googlePlay, lang),
        linkUrl: links.googlePlay!,
      ));
    }
    if (links.rustore != null) {
      badges.add(_StoreBadge(
        imageUrl: storeBadgePath(StoreType.rustore, lang),
        linkUrl: links.rustore!,
      ));
    }
    if (links.appGallery != null) {
      badges.add(_StoreBadge(
        imageUrl: storeBadgePath(StoreType.appGallery, lang),
        linkUrl: links.appGallery!,
      ));
    }

    return badges;
  }

  String _projectAnchor(ProjectId id) {
    switch (id) {
      case ProjectId.flourAndOrder:
        return 'flour-and-order';
      case ProjectId.realtOne:
        return 'realt-one';
      case ProjectId.novex:
        return 'novex';
    }
  }
}

class _StoreBadge {
  const _StoreBadge({required this.imageUrl, required this.linkUrl});

  final String imageUrl;
  final String linkUrl;
}
