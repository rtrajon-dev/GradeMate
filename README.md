# GradeMate

A Flutter app to track subjects, marks, and grades with a live result summary.

## Features

- **Add Subject** screen with form validation (name required, mark 0–100).
- **Subject List** screen using `ListView.builder`, showing each subject's name, mark, and letter grade, with swipe-to-delete (`Dismissible`).
- **Summary** screen with total subjects, average mark, and overall grade that update **live**.
- **Light / dark theme toggle** in the AppBar.
- **3 screens** navigated via a `BottomNavigationBar`.
- All state managed with **Provider** (no `setState`).

## Grade scale

| Grade | Range |
|-------|-------|
| A | ≥ 80 |
| B | ≥ 65 |
| C | ≥ 50 |
| F | < 50 |

## How to run

```bash
git clone <repo-url>
cd grademate
flutter pub get
flutter run
```

## Tech

- Flutter
- Dart
- Provider (state management)
