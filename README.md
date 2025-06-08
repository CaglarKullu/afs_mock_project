# AFS Mock Job Manager App 🧩

This is a **mock Flutter application** built for the AFS Flutter Developer recruitment task. It demonstrates CRUD operations (Create, Read, Update, Delete) on job entries, with responsive design, error handling, and filtering capabilities.

Video Demo:

https://github.com/user-attachments/assets/c1cfd8a8-d154-498d-bc2c-0f2846dbfcc9



## ✨ Features

- ✅ Add, edit, and delete jobs with title and status.
- ✅ Filter jobs by status and search query.
- ✅ Responsive UI for mobile and desktop with dark/light mode.
- ✅ Toast-based error/success feedback.
- ✅ Local backend via `json-server`.
- ✅ Structured folder architecture with Riverpod state management.
- ✅ Theme customization with AFS color palette.

---

## 🚀 Setup Instructions

### 1. Clone or download the project

```
git clone [https://github.com/CaglarKullu/afs_mock_project](https://github.com/CaglarKullu/afs_mock_project)
cd afs_mock_project
```

### 2. Install Flutter dependencies

Ensure you have Flutter SDK installed (Flutter 3.19+ recommended):

```
flutter pub get
```

### 3. Run the mock backend

> You need Node.js installed. If `json-server` is not installed globally, you can use `npx`.

```bash
npx json-server --watch db.json --port 3000
```

This will start a local REST API server at `http://localhost:3000/jobs`.

If you're testing on a mobile emulator/device, update the IP inside `lib/common/config/environment_io.dart`:

```dart
class Environment {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://<your-local-ip>:3000/jobs';
    } else {
      return 'http://localhost:3000/jobs';
    }
  }
}
```

### 4. Run the Flutter app

Use your preferred IDE or run:

```bash
flutter run -d chrome  # for web
flutter run            # for device/emulator
```

---

## 🗂 Folder Structure

```
lib/
│
├── common/               # Environment config, themes, utils
├── features/
│   └── jobs/
│       ├── models/     # Job model and status enum
│       ├── providers/  # Riverpod state providers
│       ├── screens/    # Job list screen
│       ├── widgets/    # Form, filter bar, error banner, etc.
│       └── job_index.dart
└── main.dart
```

---

## 📄 Assumptions & Notes

- Used `uuid` for generating unique job IDs.
- Simple in-memory filter logic for status and title.
- `json-server` used as mock REST backend — **no database persistence**.
- Dark mode is system-based but can be toggled.
- Error messages are handled via a `ErrorController` and displayed as toasts.

---

**Built with ❤️ by Caglar Kullu**
