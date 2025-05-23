# Digital News

**App Version:** 1.0.0+1

A cross-platform Flutter news app.

## 🚀 Getting Started

### 0. Check Your Flutter Setup
Before running the app, make sure your Flutter environment is set up correctly:
```bash
flutter doctor
```
- This command checks your Flutter installation and shows any missing dependencies for your platform.

### 1. Clone the Repository
```bash
git clone <(https://github.com/tohamydev/digital_news)>
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
