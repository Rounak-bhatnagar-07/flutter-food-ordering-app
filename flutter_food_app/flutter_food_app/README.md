# Flutter Food Ordering Workflow (BLoC)

This project is a single-workflow Flutter app for ordering food from local restaurants. It uses:
- BLoC (flutter_bloc) for state management
- SOLID architecture with repositories and services
- Error handling and realistic flow: restaurants -> menu -> cart -> checkout -> confirmation
- Unit tests (bloc_test, mocktail)

## How to run
1. Install Flutter SDK: https://flutter.dev/docs/get-started/install
2. From project root:
   ```
   flutter pub get
   flutter run
   ```

## Run tests
```
flutter test
```

## How to upload to GitHub
1. Create a new repo on GitHub (e.g. `flutter-food-workflow`).
2. From this project folder:
   ```
   git init
   git add .
   git commit -m "Initial commit - food ordering workflow"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<your-repo>.git
   git push -u origin main
   ```
Replace `<your-username>` and `<your-repo>` appropriately.
