import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../components/animated_text.dart';
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
              wordClass: 'word-fade',
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
              wordClass: 'word-fade',
              tag: 'p',
            ),
            animatedTextBlock(
              content.phone,
              appearDuration: 6,
              appearClass: 3,
              colorVar: 'var(--color-dark-gray)',
              className: 'base-text',
              wordClass: 'word-fade',
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
              wordClass: 'word-fade',
            ),
            animatedMarkdownBlock(
              content.githubUrl,
              appearDuration: 3,
              appearClass: 1,
              textColorVar: 'var(--color-dark-gray)',
              linkColorVar: 'var(--color-blue)',
              className: 'base-text',
              wordClass: 'word-fade',
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
        sectionTitle(content.aboutMeTitle, wordClass: 'word-fade'),
        animatedTextBlock(
          content.aboutMeDesc,
          appearDuration: 7,
          appearClass: 18,
          colorVar: 'var(--color-dark-gray)',
          className: 'base-text',
          wordClass: 'word-fade',
          tag: 'p',
        ),
      ],
      classes: 'stack gap-16',
    );
  }

  Component _experienceSection() {
    return div(
      [
        sectionTitle(content.experienceTitle, wordClass: 'word-fade'),
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
              wordClass: 'word-fade',
              tag: 'p',
            ),
          ],
          classes: 'experience-period',
        ),
        div(
          [
            _fadeText(
              item.position,
              className: 'h3 bold',
              appearDuration: 3,
              appearClass: 6,
            ),
            _fadeText(
              content.responsibilitiesTitle,
              className: 'base-text bold',
              appearDuration: 3,
              appearClass: 2,
            ),
            _animatedBulletList(
              item.responsibilities,
              appearDuration: 4,
              appearClass: 3,
            ),
            _fadeText(
              content.achievementsTitle,
              className: 'base-text bold',
              appearDuration: 3,
              appearClass: 4,
            ),
            _animatedBulletList(
              item.achievements,
              className: 'bullet-list bullet-dash',
              appearDuration: 4,
              appearClass: 5,
            ),
            if (item.projects.isNotEmpty) ...[
              _fadeText(
                item.projectsTitle,
                className: 'base-text bold',
                appearDuration: 3,
                appearClass: 6,
              ),
              for (final project in item.projects)
                _animatedClickableText(
                  title: project.title,
                  description: project.description,
                  href:
                      portfolioAnchor(lang, _projectAnchor(project.projectId)),
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
        sectionTitle(content.skillsTitle, appearClass: 1, wordClass: 'word-fade'),
        div(
          [
            for (final skill in content.skills)
              animatedTextBlock(
                skill,
                appearDuration: 3,
                appearClass: 2,
                colorVar: 'var(--color-dark-gray)',
                className: 'skill-chip',
                wordClass: 'word-fade',
                tag: 'span',
              ),
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
            sectionTitle(
              content.educationTitle,
              appearClass: 1,
              wordClass: 'word-fade',
            ),
            _fadeText(
              content.educationInstitution,
              className: 'base-text bold',
              appearDuration: 3,
              appearClass: 2,
            ),
            _fadeText(
              content.educationYears,
              className: 'base-text',
              appearDuration: 3,
              appearClass: 4,
            ),
          ],
          classes: 'stack gap-8',
        ),
        div(
          [
            sectionTitle(
              content.languagesTitle,
              appearClass: 1,
              wordClass: 'word-fade',
            ),
            _fadeText(
              content.languageEnglish,
              className: 'base-text',
              appearDuration: 3,
              appearClass: 2,
            ),
            _fadeText(
              content.languageRussian,
              className: 'base-text',
              appearDuration: 3,
              appearClass: 3,
            ),
          ],
          classes: 'stack gap-8',
        ),
      ],
      classes: 'grid-2 gap-24',
    );
  }

  Component _fadeText(
    String text, {
    required String className,
    String tag = 'p',
    double appearDuration = 4,
    int appearClass = 2,
  }) {
    return animatedTextBlock(
      text,
      appearDuration: appearDuration,
      appearClass: appearClass,
      colorVar: 'var(--color-dark-gray)',
      className: className,
      wordClass: 'word-fade',
      tag: tag,
    );
  }

  Component _animatedClickableText({
    required String title,
    required String description,
    required String href,
    String className = 'base-text',
    double appearDuration = 4,
    int appearClass = 2,
  }) {
    return animatedMarkdownBlock(
      '[${title}](${href}) ${description}',
      appearDuration: appearDuration,
      appearClass: appearClass,
      textColorVar: 'var(--color-dark-gray)',
      linkColorVar: 'var(--color-blue)',
      className: className,
      wordClass: 'word-fade',
    );
  }

  Component _animatedBulletList(
    List<String> items, {
    String className = 'bullet-list',
    double appearDuration = 4,
    int appearClass = 2,
  }) {
    return ul(
      [
        for (final item in items)
          li(
            [
              span(
                animatedWords(
                  '—',
                  appearDuration: appearDuration,
                  appearClass: appearClass,
                  colorVar: 'var(--color-dark-gray)',
                  wordClass: 'word-fade',
                ),
                classes: 'bullet',
              ),
              span(
                [
                  animatedMarkdownBlock(
                    item,
                    appearDuration: appearDuration,
                    appearClass: appearClass,
                    textColorVar: 'var(--color-dark-gray)',
                    linkColorVar: 'var(--color-blue)',
                    className: 'bullet-text',
                    wordClass: 'word-fade',
                    tag: 'span',
                  ),
                ],
                classes: 'bullet-content',
              ),
            ],
            classes: 'bullet-item',
          ),
      ],
      classes: className,
    );
  }

  String _projectAnchor(ProjectId id) => switch (id) {
        ProjectId.flourAndOrder => 'flour-and-order',
        ProjectId.realtOne => 'realt-one',
        ProjectId.novex => 'novex',
      };
}
