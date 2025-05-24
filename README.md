# Digital News App

## App Preview

[![Watch Preview](https://img.shields.io/badge/YouTube-Watch%20Preview-red)](https://youtube.com/shorts/YCL7wvSCsYU)

Click the button above to watch the app preview on YouTube.

## Features
- Modern and clean UI
- Category-based news filtering
- Search functionality
- Responsive design

## Getting Started
1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## Technologies Used
- Flutter
- Dart
- REST API
- Cubit State Management

# Digital News

**App Version:** 1.0.0+1

A cross-platform Flutter news app.

## ✨ App Features

- **Home News**: Browse the latest breaking news and top headlines from various categories.
- **Stories News**: View news stories in a modern, story-like format for quick and engaging updates.

## 🗂️ Project Structure

```
lib/
├── core/                # Core utilities, DI, network, constants, shared components
│   ├── components/      # Reusable UI widgets (buttons, fields, etc.)
│   ├── constants/       # App-wide constants (colors, assets, etc.)
│   ├── di/              # Dependency injection setup
│   ├── network/         # Network layer (API, Dio, etc.)
│   ├── router/          # App routing and navigation
│   └── layout/          # Main app layout and navigation shell
├── features/            # Feature modules (e.g., login, home news, stories)
│   ├── login/           # Login screen and logic
│   ├── splash/          # Splash screen and animation
│   ├── profile/         # Profile screen and user info
│   └── home_news/       # News, stories, and related screens
├── main.dart            # App entry point
```

### 📦 Features Directory Detailed Explanation

#### **splash/**
- `splash_screen.dart`: Splash screen with animation, shown at app startup.

#### **login/**
- `login_screen.dart`: Login UI and logic (email, password, login button, etc).

#### **profile/**
- `profile_screen.dart`: User profile screen, shows user info, social links, and settings.

#### **home_news/**
Implements Clean Architecture:

- **data/**
  - **datasources/news_remote_data_source.dart**: Handles fetching news from remote APIs.
  - **repositories/news_repository_impl.dart**: Implements the repository pattern, connects data sources to domain logic.
  - **models/**: Data models for articles and sources, plus generated files for JSON serialization.
    - `article_model.dart`, `source_model.dart`: Data structures for news articles and sources.
    - `*.g.dart`: Generated code for JSON (de)serialization.

- **domain/**
  - **entities/article.dart**: Core business entity for a news article.
  - **repositories/news_repository.dart**: Abstract repository interface for news operations.
  - **usecases/get_top_headlines.dart**: Use case for fetching top headlines.

- **presentation/**
  - **screens/**: UI screens for news (main, stories, details).
    - `home_news_screen.dart`: Main news feed.
    - `stories_news_screen.dart`: Stories-style news view.
    - `news_detail_screen.dart`: Detailed news article view.
  - **logic/**: State management (Cubit/Bloc) for news.
    - `home_news_cubit.dart`, `home_news_state.dart`: Cubit and state classes for managing news state.
  - **components/**: UI components for news and stories.
    - **home_news/**: Cards, search bar, categories, etc.
    - **stories_news/**: Components for stories view.
    - **shared/**: Shared UI widgets between news and stories.

---

Each feature is organized for scalability and maintainability, following best practices for modular Flutter apps.

## 🚀 Getting Started

### 0. Check Your Flutter Setup
Before running the app, make sure your Flutter environment is set up correctly:
```bash
flutter doctor
```
- This command checks your Flutter installation and shows any missing dependencies for your platform.

### 1. Clone the Repository
```bash
git clone https://github.com/tohamydev/digital_news.git
cd digital_news
```

### 2. How to Get an API Key
To use this app, you need a News API key. Follow these steps:

1. Go to [newsapi.org](https://newsapi.org/) and sign up for a free account.
2. After signing in, go to your account settings or dashboard.
3. You will find your API key under the "API key" section. It looks like this:
   ```
   8342627fcafa406a8823bf80b721b412
   ```
4. Copy your API key.
5. Create a file named `.env` in the root directory of your project and add:
   ```env
   NEWS_API_KEY=your_api_key_here
   ```
   Replace `your_api_key_here` with the key you copied.

> **Note:** Use the Developer plan for development only. For production, upgrade to a paid plan as recommended by NewsAPI.

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Code Generation (build_runner)
If you use packages like `json_serializable`, `freezed`, or `retrofit`, you need to generate code after editing models or API files:
```bash
dart run build_runner build --delete-conflicting-outputs
```
- Run this command whenever you change model classes or API definitions.

### 5. Generate App Icons (Optional)
If you want to update the app icon:
```bash
flutter pub run flutter_launcher_icons:main
```

### 6. Run the App
```bash
flutter run
```

## 📱 Assets
- Place your app icon in `assets/app_icon/icon.png` (or use platform-specific icons as configured in `pubspec.yaml`).
- Place your logo in `assets/images/logo.png`.
- Make sure to add any social icons (e.g., LinkedIn, GitHub) in `assets/images/` if used in the profile.

## 🛠️ Environment
- Flutter 3.6.1 or higher is recommended.
- Make sure you have [Flutter installed](https://docs.flutter.dev/get-started/install).

## 💡 Notes
- The app uses a `.env` file for API keys and sensitive data.
- If you add new assets, update the `pubspec.yaml` accordingly.

## 🤝 Contact
- Developer: Mohamed Tohamy
- [LinkedIn](https://linkedin.com/in/tohamydev)
- [GitHub](https://github.com/tohamydev)
- Email: tohamydev@gmail.com

---

Happy coding!
