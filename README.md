# School Companion 🎒📱

School Companion is a modern, cross-platform mobile application built with **Flutter** and **Dart** designed to bridge communication and streamline interactions between parents, teachers, and school administrators.

---

## ✨ Features

- **Role-Based Authentication & Routing**: Secure login supporting multiple user roles (`Teacher`, `Parent`, `Admin`) with reactive, provider-based navigation (`AuthGate`).
- **Teacher Dashboard**: Manage class rosters, track daily attendance, and post announcements.
- **Parent Dashboard**: Monitor academic performance, view student grades, and track attendance history in real time.
- **Gradebook & Reports**: Record and review student exam scores, term assessments, and letter grades (`A`-`D`).
- **Secure Token Management**: Persistent secure storage using `flutter_secure_storage` and automatic token injection via Dio interceptors.

---

## 🛠️ Tech Stack & Architecture

- **Framework**: Flutter (Dart)
- **State Management**: Flutter Riverpod (`NotifierProvider`, `Provider`)
- **Networking**: Dio with custom `AuthInterceptor` for automatic Bearer token injection and 401 handling
- **Security**: `flutter_secure_storage` for storing encrypted auth tokens and user roles
- **Environment**: `flutter_dotenv` for environment configuration
- **Design System**: Material 3

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android SDK / Xcode (for mobile emulation)

### Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone git@github.com:Mandela-111/school-companion.git
   cd school_companion
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**:
   Create a `.env` file in the root directory:
   ```env
   BASE_URL=https://reqres.in/api
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

---

## 🧪 Testing

Run unit and widget tests with:
```bash
flutter test
```

---

## 📄 License

This project is licensed under the MIT License.
