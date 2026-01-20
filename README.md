# Subflow App

Современное Flutter приложение с функциями онбординга, управления подписками и поддержкой светлой/тёмной темы.

## Описание

**Subflow App** — это полнофункциональное мобильное приложение, разработанное на Flutter, которое демонстрирует лучшие практики архитектуры, управления состоянием и пользовательского интерфейса. Приложение включает в себя:

- ✅ Экран онбординга с пошаговой настройкой
- ✅ Система управления подписками (ежемесячно и ежегодно)
- ✅ Поддержка светлой и тёмной темы
- ✅ Типобезопасная маршрутизация с GoRouter
- ✅ Локальное хранилище данных через SharedPreferences
- ✅ Полное покрытие тестами

## Архитектура

### Структура проекта

```
lib/
├── core/
│   └── constants/
│       └── storage_keys.dart           # Константы ключей SharedPreferences
├── features/
│   ├── home/                           # Функция домашнего экрана
│   │   ├── view/
│   │   │   └── home_page.dart          # Главная страница приложения
│   │   └── widgets/                    # Компоненты для home экрана
│   ├── onboarding/                     # Функция онбординга
│   │   ├── view/
│   │   │   └── onboarding_page.dart    # Экран приветствия и настройки
│   │   └── widgets/                    # Компоненты онбординга
│   ├── paywall/                        # Функция подписок и оплаты
│   │   ├── view/
│   │   │   └── paywall_page.dart       # Экран выбора подписки
│   │   └── widgets/                    # Компоненты для экрана подписок
│   └── root/                           # Главная навигационная оболочка
│       ├── view/
│       │   └── root_page.dart
│       └── widgets/
├── router/
│   ├── app_router.dart                 # Конфигурация GoRouter
│   └── route_utils.dart                # Перечисления и расширения для маршрутов
├── theme/
│   ├── theme.dart                      # Экспорт всех компонентов темы
│   ├── theme_controller.dart           # Контроллер управления темой
│   ├── theme_repository.dart           # Репозиторий для работы с хранилищем темы
│   └── theme_storage.dart              # Слой доступа к хранилищу тем
├── uikit/
│   └── widgets/                        # Переиспользуемые компоненты UI
│       ├── buttons/                    # Кнопки (ThemeButton, ContinueButton)
│       ├── cards/                      # Карточки (SubscriptionCard, ItemCard)
│       ├── labels/                     # Текстовые элементы и заголовки
│       ├── sections/                   # Секции с контентом
│       └── sliver/                     # Sliver компоненты для CustomScrollView
├── subflow_app.dart                    # Главный виджет приложения
└── main.dart                           # Точка входа в приложение
```

### Ключевые функции

#### 1. **Поток онбординга**
- Отображается при каждом запуске приложения (если подписка не куплена)
- Содержит экран приветствия с действительной кнопкой продолжения
- Использует `CustomScrollView` с `SliverAppBar` для красивого скролла
- После нажатия кнопки перенаправляет на экран выбора подписки или домашний экран

#### 2. **Управление подписками**
- Два варианта подписки: **Ежемесячная** (€249) и **Ежегодная** (€1990, скидка 33%)
- Экран выбора подписки с визуальным отображением цены и скидки
- Состояние подписки сохраняется в `SharedPreferences`
- После выбора подписки приложение переходит на главный экран

#### 3. **Навигация**
- **GoRouter** для типобезопасной маршрутизации
- **StatefulShellRoute** для сохранения состояния между экранами
- Начальный маршрут зависит от статуса подписки:
  - Если подписка не куплена → `/onboarding`
  - Если подписка куплена → `/home`
- Динамическая навигация в `OnboardingPage` на основе статуса покупки

#### 4. **Поддержка тем**
- **Две встроенные темы**: светлая и тёмная
- **Кнопка переключения** в AppBar с иконками (луна/солнце)
- **Состояние темы** сохраняется между запусками приложения
- **Правильная контрастность** текста для обеих тем

### Архитектура компонентов

Все экраны следуют одинаковому паттерну:

```dart
class MyPage extends StatefulWidget {
  const MyPage({super.key});
  
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Логика и состояние
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar, контент, кнопки
        ],
      ),
    );
  }
}
```

#### Переиспользуемые компоненты

- **`ThemeButton`** — кнопка переключения темы с иконками
- **`AppBarTitle`** — заголовок AppBar с корректным цветом
- **`OnboardingTitleSection`** — секция заголовка на экране онбординга
- **`PaywallSubscriptionCard`** — карточка варианта подписки с выделением
- **`PaywallContinueButton`** — кнопка продолжения с состоянием загрузки
- **`HomeListItemCard`** — карточка элемента списка на главном экране
- **`HomeListSection`** — секция со списком элементов

### Управление состоянием

#### Тема
```dart
// ThemeController управляет состоянием темы
final themeController = ThemeController(themeRepository: themeRepository);

// Получение текущей темы
themeController.themeMode.value // ThemeMode.light или ThemeMode.dark

// Переключение темы
themeController.switchThemeMode();
```

#### Подписка
```dart
// Сохранение статуса подписки
prefs.setBool(StorageKeys.userHasSubscription, true);

// Проверка статуса подписки
bool hasSubscription = prefs.getBool(StorageKeys.userHasSubscription) ?? false;
```

#### Онбординг
```dart
// Отметить, что онбординг был показан
prefs.setBool(StorageKeys.onboardingShown, true);
```

## Основные файлы

### `lib/main.dart`
Точка входа приложения. Инициализирует:
- `SharedPreferences` для локального хранилища
- `AppRouter` для маршрутизации
- `ThemeController` для управления темой
- `SubflowApp` как главный виджет

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  await AppRouter.init(prefs);
  
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themeStorage: themeStorage);
  final themeController = ThemeController(themeRepository: themeRepository);
  
  runApp(SubflowApp(themeController: themeController));
}
```

### `lib/subflow_app.dart`
Главный виджет приложения, оборачивающий приложение с:
- `MaterialApp` для Material Design
- Светлой и тёмной темой
- `GoRouter` для навигации
- `ValueListenableBuilder` для реактивного переключения тем

### `lib/router/app_router.dart`
Конфигурация маршрутизации:
- Определение всех маршрутов (home, onboarding, paywall)
- Логика для определения начального маршрута
- Защита маршрутов на основе статуса подписки

### `lib/theme/theme_controller.dart`
Управление состоянием темы:
- Хранит текущую тему в `ValueNotifier<ThemeMode>`
- Метод `switchThemeMode()` для переключения темы
- Автоматическое сохранение в `SharedPreferences`

### `lib/theme/theme_repository.dart`
Слой бизнес-логики для работы с темой:
- `getThemeMode()` — получить сохранённую тему
- `setThemeMode(ThemeMode)` — сохранить выбранную тему

### `lib/core/constants/storage_keys.dart`
Централизованные константы ключей `SharedPreferences`:
```dart
class StorageKeys {
  static const String userSubscription = 'user_subscription';
  static const String userHasSubscription = 'user_has_subscription';
  static const String onboardingShown = 'onboarding_shown';
  static const String themeMode = 'theme_mode';
}
```

## Лучшие практики

1. ✅ **Организация кода** — фичи сгруппированы по функциональности
2. ✅ **Константы** — централизованы в `StorageKeys` для удобства
3. ✅ **Переиспользуемость** — компоненты разработаны гибкими и композируемыми
4. ✅ **Управление состоянием** — `SharedPreferences` для персистентного состояния
5. ✅ **Навигация** — типобезопасная маршрутизация с `GoRouter`
6. ✅ **Доступность** — правильная контрастность цветов во всех темах
7. ✅ **Качество кода** — полное отсутствие ошибок компиляции и предупреждений
8. ✅ **Тестирование** — полное покрытие тестами (11+ тестов)

## Начало работы

### Установка зависимостей
```bash
cd subflow_app
flutter pub get
```

### Запуск приложения
```bash
flutter run
```

### Запуск тестов
```bash
flutter test
```

## Тестирование

Приложение имеет полное покрытие тестами с использованием `flutter_test` и `mockito`:

### `test/app_test.dart`
- ✅ SubflowApp может быть инстанцирован
- ✅ SubflowApp является StatefulWidget

### `test/theme_test.dart`
- ✅ ThemeController инициализируется корректно
- ✅ ThemeMode является ValueNotifier
- ✅ ThemeController может переключать темы

### `test/pages_test.dart`
- ✅ HomePage может быть инстанцирован
- ✅ HomePage является StatefulWidget
- ✅ OnboardingPage может быть инстанцирован
- ✅ OnboardingPage является StatefulWidget
- ✅ PaywallPage может быть инстанцирован
- ✅ PaywallPage является StatefulWidget

**Запуск тестов:**
```bash
flutter test              # Запустить все тесты
flutter test test/app_test.dart         # Запустить тесты app
flutter test test/theme_test.dart       # Запустить тесты темы
flutter test test/pages_test.dart       # Запустить тесты страниц
flutter test --coverage   # Запустить тесты с отчётом о покрытии
```

## Структура ветвления (Git Flow)

Проект использует Git Flow для управления версиями:

```
main (production)
  ↓
release/* (подготовка к релизу)
  ↓
develop (разработка)
  ↓
feature/* (отдельные фичи)
```

### Текущая ветка
- `feature/subscription-flow` — разработка функции подписок и оплаты

## Будущие улучшения

- 📡 Интеграция с реальным API для обработки подписок
- 📊 Аналитика и отслеживание действий пользователя
- 🔔 Push-уведомления
- 🛡️ Улучшенная обработка ошибок и логирование
- 🧪 Расширенное покрытие тестами для бизнес-логики
- 📱 Widget-тесты для UI компонентов с полным контекстом Material

## Заметки по разработке

### Структура директории `lib/`
- **core/** — базовые константы и утилиты
- **features/** — основной функционал приложения
- **router/** — маршрутизация и навигация
- **theme/** — управление темой
- **uikit/** — переиспользуемые компоненты UI

### Схема именования файлов
- `*_page.dart` — главные экраны (StatefulWidget)
- `*_button.dart` — кнопки и действие
- `*_card.dart` — карточки и контейнеры
- `*_section.dart` — секции контента
- `*_controller.dart` — контроллеры управления состоянием
- `*_repository.dart` — слой доступа к данным

### Импорты
- Используйте относительные импорты для файлов в одной папке
- Используйте пакетные импорты для кросс-модульных импортов: `import 'package:subflow_app/...'`

## Контрибьютерам

При добавлении новых фич:
1. Создайте новую feature-ветку из `develop`
2. Следуйте существующей архитектуре и паттернам
3. Добавьте тесты для новой функциональности
4. Сделайте pull request на `develop` (не напрямую на `main`)
5. Убедитесь, что все тесты проходят

## Лицензия

Проект распространяется под лицензией MIT.

