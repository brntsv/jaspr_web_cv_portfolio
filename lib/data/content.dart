enum Lang { ru, en }

typedef Strings = Map<String, String>;

class AppContent {
  const AppContent({
    required this.lang,
    required this.yourName,
    required this.yourJob,
    required this.email,
    required this.phone,
    required this.telegramUrl,
    required this.githubUrl,
    required this.aboutMeTitle,
    required this.aboutMeDesc,
    required this.projectsTitle,
    required this.experienceTitle,
    required this.responsibilitiesTitle,
    required this.achievementsTitle,
    required this.skillsTitle,
    required this.skillsList,
    required this.educationTitle,
    required this.educationInstitution,
    required this.educationYears,
    required this.languagesTitle,
    required this.languageEnglish,
    required this.languageRussian,
    required this.aboutMeBlog,
    required this.cvLabel,
    required this.portfolioLabel,
    required this.aboutThisPageTitle,
    required this.socialsTitle,
    required this.blogFooterDesc,
    required this.blogFooterDesc2,
    required this.contributingTitle,
    required this.nativeWebscroll,
    required this.nativeWebscrollDesc,
    required this.linkedin,
    required this.github,
    required this.telegram,
    required this.projectStrings,
    required this.experiences,
  });

  final Lang lang;
  final String yourName;
  final String yourJob;
  final String email;
  final String phone;
  final String telegramUrl;
  final String githubUrl;
  final String aboutMeTitle;
  final String aboutMeDesc;
  final String projectsTitle;
  final String experienceTitle;
  final String responsibilitiesTitle;
  final String achievementsTitle;
  final String skillsTitle;
  final String skillsList;
  final String educationTitle;
  final String educationInstitution;
  final String educationYears;
  final String languagesTitle;
  final String languageEnglish;
  final String languageRussian;
  final String aboutMeBlog;
  final String cvLabel;
  final String portfolioLabel;
  final String aboutThisPageTitle;
  final String socialsTitle;
  final String blogFooterDesc;
  final String blogFooterDesc2;
  final String contributingTitle;
  final String nativeWebscroll;
  final String nativeWebscrollDesc;
  final String linkedin;
  final String github;
  final String telegram;
  final Map<ProjectId, ProjectStrings> projectStrings;
  final List<ExperienceItem> experiences;

  List<String> get skills => skillsList.split(RegExp(r'\s{2,}'));
}

class ProjectStrings {
  const ProjectStrings({
    required this.title,
    required this.shortDesc,
    required this.descriptionIntro,
    required this.descriptionItems,
  });

  final String title;
  final String shortDesc;
  final String descriptionIntro;
  final List<String> descriptionItems;
}

enum ProjectId { flourAndOrder, realtOne, novex }

class StoreLinks {
  const StoreLinks({
    this.appStore,
    this.googlePlay,
    this.rustore,
    this.appGallery,
  });

  final String? appStore;
  final String? googlePlay;
  final String? rustore;
  final String? appGallery;

  bool get hasAny =>
      appStore != null ||
      googlePlay != null ||
      rustore != null ||
      appGallery != null;
}

enum StoreType { appStore, googlePlay, rustore, appGallery }

String storeBadgePath(StoreType type, Lang lang) {
  switch (type) {
    case StoreType.appStore:
      return lang == Lang.ru
          ? '/assets/images/store_badges/appstore_ru.svg'
          : '/assets/images/store_badges/appstore_en.svg';
    case StoreType.googlePlay:
      return lang == Lang.ru
          ? '/assets/images/store_badges/gplay_ru.svg'
          : '/assets/images/store_badges/gplay_en.svg';
    case StoreType.rustore:
      return lang == Lang.ru
          ? '/assets/images/store_badges/rustore_ru.svg'
          : '/assets/images/store_badges/rustore_en.svg';
    case StoreType.appGallery:
      return lang == Lang.ru
          ? '/assets/images/store_badges/appgallery_ru.svg'
          : '/assets/images/store_badges/appgallery_en.svg';
  }
}

class ProjectAssets {
  const ProjectAssets({
    required this.iconPath,
    required this.backgroundColor,
    required this.screenshots,
    required this.storeLinks,
  });

  final String iconPath;
  final String backgroundColor;
  final List<String> screenshots;
  final StoreLinks storeLinks;
}

class ExperienceItem {
  const ExperienceItem({
    required this.period,
    required this.position,
    required this.responsibilities,
    required this.achievements,
    required this.projectsTitle,
    required this.projects,
  });

  final String period;
  final String position;
  final List<String> responsibilities;
  final List<String> achievements;
  final String projectsTitle;
  final List<ExperienceProject> projects;
}

class ExperienceProject {
  const ExperienceProject({
    required this.projectId,
    required this.title,
    required this.description,
  });

  final ProjectId projectId;
  final String title;
  final String description;
}

AppContent contentFor(Lang lang) => lang == Lang.ru ? contentRu : contentEn;

const projectAssets = <ProjectId, ProjectAssets>{
  ProjectId.flourAndOrder: ProjectAssets(
    iconPath: '/assets/images/project_icons/icon-flour-order.png',
    backgroundColor: '#F6EEE3',
    screenshots: _flourScreens,
    storeLinks: StoreLinks(
      rustore: 'https://www.rustore.ru/catalog/app/com.flour.order',
    ),
  ),
  ProjectId.realtOne: ProjectAssets(
    iconPath: '/assets/images/project_icons/icon-realt-one.png',
    backgroundColor: 'rgba(29, 185, 84, 0.3)',
    screenshots: _realtScreens,
    storeLinks: StoreLinks(
      appStore: 'https://apps.apple.com/us/app/realt-one/id6742776096',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.realtone.realt_one',
    ),
  ),
  ProjectId.novex: ProjectAssets(
    iconPath: '/assets/images/project_icons/icon-novex.png',
    backgroundColor: 'rgba(2, 118, 195, 0.4)',
    screenshots: _novexScreens,
    storeLinks: StoreLinks(
      appStore:
          'https://apps.apple.com/ru/app/%D0%BDovex-%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%B0%D0%BA%D1%86%D0%B8%D0%B8/id1608874837',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.creonit.novex',
      rustore: 'https://www.rustore.ru/catalog/app/com.creonit.novex',
      appGallery: 'https://appgallery.huawei.com/app/C107281171',
    ),
  ),
};

const contentRu = AppContent(
  lang: Lang.ru,
  yourName: 'Никита Баранцев',
  yourJob: 'Flutter Developer',
  email: 'brntsv.n@gmail.com',
  phone: '+7 913 017 65 94',
  telegramUrl: 'Telegram: [@bntsv](https://t.me/bntsv)',
  githubUrl: 'GitHub: [brntsv](https://github.com/brntsv)',
  aboutMeTitle: 'Обо мне',
  aboutMeDesc:
      'Делаю мобильные приложения устойчивыми, понятными и готовыми к росту. Умею с нуля запускать MVP, продумывать архитектуру и требования вместе с командой, автоматизировать сборки и улучшать продукт за счёт метрик, UX и производительности.',
  projectsTitle: 'Проекты',
  experienceTitle: 'Опыт работы',
  responsibilitiesTitle: 'Обязанности:',
  achievementsTitle: 'Достижения:',
  skillsTitle: 'Навыки',
  skillsList:
      'Dart   Flutter   flutter_bloc   dio   retrofit   auto_route   get_it   injectable   rxdart   EventBus    drift    build_runner    json_annotation    freezed   AppLinks   Push Notifications    flavors   fastlane   Makefile   GitLab CI/CD   mason   Firebase    analysis_options   Animations   geolocator   geodesy   fvm   git',
  educationTitle: 'Образование',
  educationInstitution: 'СГУПС (г. Новосибирск)',
  educationYears: '2014 - 2019 уч. гг.',
  languagesTitle: 'Языки',
  languageEnglish: 'Английский - Intermediate / B1',
  languageRussian: 'Русский - Native',
  aboutMeBlog:
      'Привет! Я Никита, Flutter разработчик. Здесь делюсь проектами и заметками о том, что меня вдохновляет. Помимо Flutter интересуюсь Rust.',
  cvLabel: 'Резюме',
  portfolioLabel: 'Портфолио',
  aboutThisPageTitle: 'Об этой странице',
  socialsTitle: 'Соцсети',
  blogFooterDesc:
      'Этот сайт создан на [Jaspr](https://jaspr.site/), хостинг на Vercel. [Код доступен](https://github.com/brntsv/jaspr_web_cv_portfolio) на Github.',
  blogFooterDesc2:
      'Проект вдохновлен [репозиторием](https://github.com/filiph/filiphnet) Filip Hráček',
  contributingTitle: 'Contributing',
  nativeWebscroll: '[native_web_scroll](https://pub.dev/packages/native_web_scroll)',
  nativeWebscrollDesc: '  нативный веб скролл для Flutter for Web',
  linkedin: '[Linkedin](https://www.linkedin.com/in/bntsv/)',
  github: '[Github](https://github.com/brntsv)',
  telegram: '[Telegram](https://t.me/bntsv)',
  projectStrings: {
    ProjectId.flourAndOrder: ProjectStrings(
      title: 'Мука и Порядок',
      shortDesc: ' планировщик заказов для кондитеров',
      descriptionIntro: 'Планировщик заказов для кондитеров и пекарей',
      descriptionItems: [
        'Спроектировал MVP с нуля: выделил слои приложения, собрал подходящий стек пакетов и ui_kit, чтобы продукт было проще развивать дальше',
        'Обращал внимание на пробелы в ТЗ и UX-сценариях, уточнял требования с заказчиком и предлагал более удобные пользовательские потоки, закрывая пропущенные тесткейсы и снижая риск доработок на поздних этапах',
        'Настроил сборки и публикацию во все целевые магазины: App Store, Google Play, RuStore и AppGallery через скрипты на Makefile + fastlane',
        'Реализовал оплаты как через нативные шторки in_app_purchase, так и через WebView с ЮKassa, чтобы покрыть разные сценарии и платформенные ограничения',
        'Добавил контроль соединения на базе internet_connection_checker и собственного интерсептора, чтобы обрабатывать сетевые ошибки',
      ],
    ),
    ProjectId.realtOne: ProjectStrings(
      title: 'Realt One',
      shortDesc: ' приложение для риэлторов',
      descriptionIntro:
          'Приложение для риэлторов, в данный момент работает с объектами в Новосибирске и в Москве',
      descriptionItems: [
        'С нуля спроектировал и собрал MVP: определил слои приложения и подобрал стек пакетов так, чтобы продукт было удобно развивать дальше',
        'Сформулировал требования к новому API и согласовал их с командой бэкенда, а также интегрировал несколько уже существующих API заказчика, приведя их к единому контракту и слою абстракций',
        'Реализовал ключевые фичи для работы с объектами: шахматку (срез дома), экран этажей и интерактивный генплан; и там, и там использовал CustomPainter — оверлеи строятся по координатам, которые присылает бэкенд',
        'Реализовал специфичный функционал под запросы заказчика: уведомления, сохранение базы клиентов, формирование заявок; чтобы несколько экранов реагировали на действия друг друга, настроил обмен событиями между BLoC’ами через собственную реализацию EventBus',
      ],
    ),
    ProjectId.novex: ProjectStrings(
      title: 'Novex',
      shortDesc: ' E-comm приложение для сети хозяйственных магазинов',
      descriptionIntro:
          'E-commerce приложение для сети хозяйственных магазинов в Сибири',
      descriptionItems: [
        'Повысил crash-free с ~59% до 99% (по данным AppMetrica), найдя и исправив критические баги, из‑за которых приложение падало у части пользователей',
        'Ускорил загрузку экранов за счёт оптимизации загрузки и кеширования изображений; подробнее о подходе в [статье](https://medium.com/make-android/save-your-memory-usage-by-optimizing-network-image-in-flutter-cbc9f8af47cd)',
        'Интегрировал SearchBooster, расширив возможности поиска по каталогу',
        'Настроил GitLab CI/CD, что сократило время выхода новых версий',
        'Работал над крупными фичами: редизайн ключевых экранов, новое отображение наличия товара, добавление новых способов доставки, голосовой поиск',
        'Добавил шиммер‑скелетоны, благодаря чему загрузка контента воспринимается быстрее',
      ],
    ),
  },
  experiences: [
    ExperienceItem(
      period: 'март 2025 — ноябрь 2025',
      position: 'Flutter Developer в Muka Team',
      responsibilities: [
        'Архитектура и разработка MVP: слои приложения, стек пакетов, ui_kit;',
        'Планирование фич и проработка требований: поиск и закрытие пробелов в ТЗ и UX-сценариях;',
        'Интеграция платежей, push-уведомлений, метрик и сторонних сервисов;',
        'Настройка сборок, окружений и релизов (Makefile + fastlane, сторы);',
        'Качество и UX: обработка сетевых ошибок, шиммеры и подсказки для пользователей.',
      ],
      achievements: [
        'Запустил MVP «Мука и Порядок» с нуля и довёл до публикации в App Store, Google Play, RuStore и AppGallery;',
        'Спроектировал масштабируемую архитектуру с ui_kit, упростив дальнейшее развитие продукта;',
        'Автоматизировал сборки и релизы через Makefile + fastlane, сократив время вывода версий;',
        'Добавил шиммер‑скелетоны и анимированные подсказки, улучшив онбординг и вовлечённость пользователей;',
        'Реализовал контроль соединения (internet_connection_checker + интерсептор) для обработки сетевых ошибок.',
      ],
      projectsTitle: 'Приложение:',
      projects: [
        ExperienceProject(
          projectId: ProjectId.flourAndOrder,
          title: 'Мука и Порядок',
          description: ' планировщик заказов для кондитеров',
        ),
      ],
    ),
    ExperienceItem(
      period: 'май 2023 — наст. вр.',
      position: 'Flutter Developer в NaN Agency',
      responsibilities: [
        'Архитектура и дизайн MVP/фич: слои приложения, стек пакетов, ui_kit;',
        'Проработка требований и API вместе с бэкендом: договаривался о форматах данных, сценариях ошибок и интеграции со сторонними сервисами;',
        'Разработка сложных интерфейсов и доменных фич (схемы строительных объектов, каталог, корзина, поиск, карты);',
        'Производительность и стабильность: профилирование, оптимизация, снижение количества падений;',
        'Сборки и релизы: окружения, автоматизация (Makefile, fastlane, GitLab CI/CD), публикации в сторы.',
      ],
      achievements: [
        'Повысил crash-free с ~59% до 99% (AppMetrica), устранив критические падения;',
        'Спроектировал и реализовал MVP с нуля, заложив масштабируемую архитектуру;',
        'Реализовал ключевые визуальные фичи для недвижимости: шахматку, экран этажей и интерактивный генплан на базе CustomPainter;',
        'Ускорил визуальную загрузку экранов за счёт оптимизации загрузки/кеширования изображений и ввода шиммер‑скелетонов;',
        'Настроил GitLab CI/CD и автоматизированные релизы (Makefile + fastlane), сократив время вывода новых версий;',
        'Интегрировал SearchBooster и DaData, усилив поиск по каталогу и работу с формами.',
      ],
      projectsTitle: 'Проекты, на которых работал продолжительное время:',
      projects: [
        ExperienceProject(
          projectId: ProjectId.realtOne,
          title: 'Realt One',
          description: ' приложение для риэлторов',
        ),
        ExperienceProject(
          projectId: ProjectId.novex,
          title: 'Novex',
          description: ' E-comm приложение для сети хозяйственных магазинов',
        ),
      ],
    ),
  ],
);

const contentEn = AppContent(
  lang: Lang.en,
  yourName: 'Nikita Barantsev',
  yourJob: 'Flutter Developer',
  email: 'brntsv.n@gmail.com',
  phone: '+7 913 017 65 94',
  telegramUrl: 'Telegram: [@bntsv](https://t.me/bntsv)',
  githubUrl: 'GitHub: [brntsv](https://github.com/brntsv)',
  aboutMeTitle: 'About me',
  aboutMeDesc:
      'Create fast, stable, and user-friendly mobile applications. Love architecture and release automation. Work from goals and UX, not from formal Technical Specifications.',
  projectsTitle: 'Projects',
  experienceTitle: 'Work Experience',
  responsibilitiesTitle: 'Responsibilities:',
  achievementsTitle: 'Achievements:',
  skillsTitle: 'Skills',
  skillsList:
      'Dart   Flutter   flutter_bloc   dio   retrofit   auto_route   get_it   injectable   rxdart   EventBus    drift    build_runner    json_annotation    freezed   AppLinks   Push Notifications    flavors   fastlane   Makefile   GitLab CI/CD   mason   Firebase    analysis_options   Animations   geolocator   geodesy   fvm   git',
  educationTitle: 'Education',
  educationInstitution: 'STU (Novosibirsk)',
  educationYears: '2014 - 2019',
  languagesTitle: 'Languages',
  languageEnglish: 'English - Intermediate / B1',
  languageRussian: 'Russian - Native',
  aboutMeBlog:
      'Hi! I\'m Nikita, a Flutter developer. Here I share projects and notes on what inspires me. Besides Flutter, I\'m into Rust.',
  cvLabel: 'CV',
  portfolioLabel: 'Portfolio',
  aboutThisPageTitle: 'About this page',
  socialsTitle: 'Socials',
  blogFooterDesc:
      'This site is built with Flutter Web and the hosting is on Firebase. [Code is available](https://github.com/brntsv/flutter_web_cv_portfolio) on Github.',
  blogFooterDesc2:
      'Project inspired by [repository](https://github.com/filiph/filiphnet) Filip Hráček',
  contributingTitle: 'Contributing',
  nativeWebscroll: '[native_web_scroll](https://pub.dev/packages/native_web_scroll)',
  nativeWebscrollDesc: '  native web scrolling for Flutter for Web',
  linkedin: '[Linkedin](https://www.linkedin.com/in/bntsv/)',
  github: '[Github](https://github.com/brntsv)',
  telegram: '[Telegram](https://t.me/bntsv)',
  projectStrings: {
    ProjectId.flourAndOrder: ProjectStrings(
      title: 'Мука и Порядок',
      shortDesc: ' order planner for confectioners',
      descriptionIntro: 'Order planner for confectioners and bakers',
      descriptionItems: [
        'Designed the MVP from scratch: defined application layers, assembled an appropriate package stack and a ui_kit to make the product easier to evolve',
        'Spotted gaps in the requirements and UX scenarios, clarified them with the client and proposed smoother user flows, covering missing test cases and reducing the risk of late rework',
        'Set up builds and distribution to all target stores — App Store, Google Play, RuStore and AppGallery — via Makefile + fastlane scripts',
        'Implemented payments both via native in_app_purchase sheets and a WebView with YooKassa to cover different scenarios and platform limitations',
        'Added connectivity checks based on internet_connection_checker and a custom interceptor to handle network errors',
      ],
    ),
    ProjectId.realtOne: ProjectStrings(
      title: 'Realt One',
      shortDesc: ' app for realtors',
      descriptionIntro:
          'An app for realtors, currently working with properties in Novosibirsk and Moscow',
      descriptionItems: [
        'Designed and built the MVP from scratch: defined application layers and selected a package stack that makes the product easy to grow',
        'Defined requirements for a new API and aligned them with the backend team, and integrated several existing client APIs by unifying them under a single contract and abstraction layer',
        'Implemented key features for working with properties: a building grid view (“chessboard”), floor screen and interactive master plan; in all of them used CustomPainter — overlays are built from coordinates provided by the backend',
        'Delivered customer-specific functionality: notifications, client base storage and lead creation; wired screens together via an EventBus between BLoCs so several screens react to each other\'s actions',
      ],
    ),
    ProjectId.novex: ProjectStrings(
      title: 'Novex',
      shortDesc: ' app for a network of household stores',
      descriptionIntro: 'E-commerce app for a household goods retail chain in Siberia',
      descriptionItems: [
        'Increased crash-free rate from ~59% to 99% (AppMetrica) by finding and fixing critical bugs that were causing crashes for part of the user base',
        'Improved screen load times by optimizing image loading and caching; the approach is described in [this article](https://medium.com/make-android/save-your-memory-usage-by-optimizing-network-image-in-flutter-cbc9f8af47cd)',
        'Integrated SearchBooster, expanding catalog search capabilities',
        'Set up GitLab CI/CD, which reduced time-to-release for new versions',
        'Worked on major features: redesign of key screens, new stock availability display, additional delivery options, voice search',
        'Added shimmer skeletons, making content loading feel faster',
      ],
    ),
  },
  experiences: [
    ExperienceItem(
      period: 'march 2025 — november 2025',
      position: 'Flutter Developer at Muka Team',
      responsibilities: [
        'Architecture and MVP development: application layers, package stack, ui_kit;',
        'Feature planning and requirements refinement: identifying and closing gaps in specs and UX scenarios;',
        'Integration of payments, push notifications, analytics/metrics and third-party services;',
        'Build, environments and releases setup (Makefile, fastlane, app stores);',
        'Quality and UX: network error handling, shimmers and user hints.',
      ],
      achievements: [
        'Launched the “Flour and Order” MVP from scratch and delivered it to App Store, Google Play, RuStore and AppGallery;',
        'Designed a scalable architecture with a ui_kit, simplifying further product development;',
        'Automated builds and releases with Makefile + fastlane, reducing time-to-release;',
        'Added shimmer skeletons and animated hints, improving onboarding and user engagement;',
        'Implemented connectivity control (internet_connection_checker + interceptor), reducing errors caused by unstable internet.',
      ],
      projectsTitle: 'Application:',
      projects: [
        ExperienceProject(
          projectId: ProjectId.flourAndOrder,
          title: 'Мука и Порядок',
          description: ' order planner for confectioners',
        ),
      ],
    ),
    ExperienceItem(
      period: 'may 2023 — present',
      position: 'Flutter Developer at NaN Agency',
      responsibilities: [
        'Architecture and design of MVP/features: application layers, package stack, ui_kit;',
        'Requirements and API refinement together with the backend team: aligning on data formats, error scenarios and integration with third-party services;',
        'Development of complex interfaces and domain features (property schemes, catalog, cart, search, maps);',
        'Performance and stability: profiling, optimization, reducing crashes;',
        'Builds and releases: environments, automation (Makefile, fastlane, GitLab CI/CD), publishing to app stores.',
      ],
      achievements: [
        'Increased crash-free rate from ~59% to 99% (AppMetrica) by fixing critical crashes;',
        'Designed and implemented an MVP from scratch, laying a scalable architecture;',
        'Delivered key visual features for real estate: building grid, floor screen and interactive master plan based on CustomPainter;',
        'Improved screen load times by optimizing image loading/caching and adding shimmer skeletons;',
        'Set up GitLab CI/CD and automated releases (Makefile + fastlane), reducing time-to-release;',
        'Integrated SearchBooster and DaData, strengthening catalog search and form handling.',
      ],
      projectsTitle: 'Projects I worked on for an extended period:',
      projects: [
        ExperienceProject(
          projectId: ProjectId.realtOne,
          title: 'Realt One',
          description: ' app for realtors',
        ),
        ExperienceProject(
          projectId: ProjectId.novex,
          title: 'Novex',
          description: ' app for a network of household stores',
        ),
      ],
    ),
  ],
);

const _flourScreens = [
  '/assets/images/screenshots/flour_and_order/flour_01.png',
  '/assets/images/screenshots/flour_and_order/flour_02.png',
  '/assets/images/screenshots/flour_and_order/flour_03.png',
  '/assets/images/screenshots/flour_and_order/flour_04.png',
  '/assets/images/screenshots/flour_and_order/flour_05.png',
  '/assets/images/screenshots/flour_and_order/flour_06.png',
  '/assets/images/screenshots/flour_and_order/flour_07.png',
  '/assets/images/screenshots/flour_and_order/flour_08.png',
  '/assets/images/screenshots/flour_and_order/flour_09.png',
  '/assets/images/screenshots/flour_and_order/flour_10.png',
  '/assets/images/screenshots/flour_and_order/flour_11.png',
  '/assets/images/screenshots/flour_and_order/flour_12.png',
  '/assets/images/screenshots/flour_and_order/flour_13.png',
  '/assets/images/screenshots/flour_and_order/flour_14.png',
  '/assets/images/screenshots/flour_and_order/flour_15.png',
  '/assets/images/screenshots/flour_and_order/flour_16.png',
  '/assets/images/screenshots/flour_and_order/flour_17.png',
  '/assets/images/screenshots/flour_and_order/flour_18.png',
  '/assets/images/screenshots/flour_and_order/flour_19.png',
];

const _realtScreens = [
  '/assets/images/screenshots/realt_one/realt_01.png',
  '/assets/images/screenshots/realt_one/realt_02.png',
  '/assets/images/screenshots/realt_one/realt_03.png',
  '/assets/images/screenshots/realt_one/realt_04.png',
  '/assets/images/screenshots/realt_one/realt_05.png',
  '/assets/images/screenshots/realt_one/realt_06.png',
  '/assets/images/screenshots/realt_one/realt_07.png',
  '/assets/images/screenshots/realt_one/realt_08.png',
  '/assets/images/screenshots/realt_one/realt_09.png',
  '/assets/images/screenshots/realt_one/realt_10.png',
  '/assets/images/screenshots/realt_one/realt_11.png',
  '/assets/images/screenshots/realt_one/realt_12.png',
  '/assets/images/screenshots/realt_one/realt_13.png',
  '/assets/images/screenshots/realt_one/realt_14.png',
  '/assets/images/screenshots/realt_one/realt_15.png',
  '/assets/images/screenshots/realt_one/realt_16.png',
  '/assets/images/screenshots/realt_one/realt_17.png',
  '/assets/images/screenshots/realt_one/realt_18.png',
  '/assets/images/screenshots/realt_one/realt_19.png',
];

const _novexScreens = [
  '/assets/images/screenshots/novex/novex_01.png',
  '/assets/images/screenshots/novex/novex_02.png',
  '/assets/images/screenshots/novex/novex_03.png',
  '/assets/images/screenshots/novex/novex_04.png',
  '/assets/images/screenshots/novex/novex_05.png',
  '/assets/images/screenshots/novex/novex_06.png',
  '/assets/images/screenshots/novex/novex_07.png',
  '/assets/images/screenshots/novex/novex_08.png',
  '/assets/images/screenshots/novex/novex_09.png',
  '/assets/images/screenshots/novex/novex_10.png',
  '/assets/images/screenshots/novex/novex_11.png',
  '/assets/images/screenshots/novex/novex_12.png',
  '/assets/images/screenshots/novex/novex_13.png',
  '/assets/images/screenshots/novex/novex_14.png',
  '/assets/images/screenshots/novex/novex_15.png',
];
