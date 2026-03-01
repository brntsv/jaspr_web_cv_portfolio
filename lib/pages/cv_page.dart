import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../components/animated_text.dart';
import '../components/bullet_list.dart';
import '../components/clickable_text.dart';
import '../components/section_title.dart';
import '../data/content.dart';
import '../data/routes.dart';

class CvPage extends StatelessComponent {
  const CvPage({
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
              '${content.yourName}, ${content.yourJob}',
              appearDuration: 4,
              appearClass: 20,
              colorVar: 'var(--color-dark-gray)',
              className: 'h1',
              tag: 'h1',
            ),
            _contactSection(),
            _aboutSection(),
            _experienceSection(),
            _skillsSection(),
            _educationLanguages(),
          ],
          classes: 'stack gap-32',
        ),
      ],
      classes: 'page cv',
    );
  }

  Component _contactSection() {
    return div(
      [
        div(
          [
            animatedTextBlock(
              content.email,
              appearDuration: 3,
              appearClass: 1,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              tag: 'p',
            ),
            animatedTextBlock(
              content.phone,
              appearDuration: 6,
              appearClass: 3,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              tag: 'p',
            ),
            animatedTextBlock(
              content.location,
              appearDuration: 3,
              appearClass: 1,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              tag: 'p',
            ),
          ],
          classes: 'stack gap-8',
        ),
        div(
          [
            animatedMarkdownBlock(
              content.telegramUrl,
              appearDuration: 6,
              appearClass: 3,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
            ),
            animatedMarkdownBlock(
              content.githubUrl,
              appearDuration: 3,
              appearClass: 1,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
            ),
          ],
          classes: 'stack gap-8',
        ),
      ],
      classes: 'grid-2 gap-24',
    );
  }

  Component _aboutSection() {
    return div(
      [
        sectionTitle(content.aboutMeTitle),
        animatedTextBlock(
          content.aboutMeDesc,
          appearDuration: 7,
          appearClass: 18,
          colorVar: 'var(--color-dark-gray)',
          className: 'base-text',
          tag: 'p',
        ),
      ],
      classes: 'stack gap-16',
    );
  }

  Component _experienceSection() {
    return div(
      [
        sectionTitle(content.experienceTitle),
        for (final item in content.experiences) _experienceItem(item),
      ],
      classes: 'stack gap-16',
    );
  }

  Component _experienceItem(ExperienceItem item) {
    return div(
      [
        div(
          [
            animatedTextBlock(
              item.period,
              appearDuration: 3,
              appearClass: 1,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              tag: 'p',
            ),
          ],
          classes: 'experience-period',
        ),
        div(
          [
            p([text(item.position)], classes: 'h3 bold'),
            p([text(content.responsibilitiesTitle)], classes: 'base-text bold'),
            bulletList(item.responsibilities),
            p([text(content.achievementsTitle)], classes: 'base-text bold'),
            bulletList(item.achievements, className: 'bullet-list bullet-dash'),
            if (item.projects.isNotEmpty) ...[
              p([text(item.projectsTitle)], classes: 'base-text bold'),
              for (final project in item.projects)
                clickableText(
                  title: project.title,
                  description: project.description,
                  href: portfolioAnchor(lang, _projectAnchor(project.projectId)),
                ),
            ],
          ],
          classes: 'stack gap-8',
        ),
      ],
      classes: 'experience-item',
    );
  }

  Component _skillsSection() {
    return div(
      [
        sectionTitle(content.skillsTitle, appearClass: 1),
        div(
          [
            for (final skill in content.skills)
              span([text(skill)], classes: 'skill-chip'),
          ],
          classes: 'skills-wrap',
        ),
      ],
      classes: 'stack gap-16',
    );
  }

  Component _educationLanguages() {
    return div(
      [
        div(
          [
            sectionTitle(content.educationTitle, appearClass: 1),
            p([text(content.educationInstitution)], classes: 'base-text bold'),
            p([text(content.educationYears)], classes: 'base-text'),
          ],
          classes: 'stack gap-8',
        ),
        div(
          [
            sectionTitle(content.languagesTitle, appearClass: 1),
            p([text(content.languageEnglish)], classes: 'base-text'),
            p([text(content.languageRussian)], classes: 'base-text'),
          ],
          classes: 'stack gap-8',
        ),
      ],
      classes: 'grid-2 gap-24',
    );
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
