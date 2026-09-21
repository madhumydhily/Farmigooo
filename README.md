# FARMIGO — Unified Digital Agriculture Platform

FARMIGO is a unified digital agriculture ecosystem connecting farmers, landowners, agricultural workers, machinery providers, consultants, produce buyers/sellers, and agricultural authorities through a modern, mobile and web platform.

---

## Technology Stack

- **Frontend**: Flutter 3.47.5 & Dart 3.13.4 (Null-Safe, Material 3 UI)
- **Backend Infrastructure**: Firebase (`firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`)
- **State & Architecture**: Feature-First Clean Architecture
- **Platforms**: Mobile (Android/iOS), Web, and Desktop (macOS)

---

## Firebase Setup Overview

- **Firebase Project ID**: `farmigooo`
- **Configuration File**: [`lib/firebase_options.dart`](file:///Users/sruthis/Desktop/Farmigo/Farmigooo/lib/firebase_options.dart)
- **Database Security Rules**: [`firestore.rules`](file:///Users/sruthis/Desktop/Farmigo/Farmigooo/firestore.rules)
- **Storage Security Rules**: [`storage.rules`](file:///Users/sruthis/Desktop/Farmigo/Farmigooo/storage.rules)

> Detailed architecture guidelines are available in [`docs/PROJECT_ARCHITECTURE.md`](file:///Users/sruthis/Desktop/Farmigo/Farmigooo/docs/PROJECT_ARCHITECTURE.md).

---

## Project Structure

```text
lib/
├── main.dart                          # App entrypoint & Firebase async initialization
├── firebase_options.dart              # FlutterFire generated configuration
├── core/                              # Core foundation & shared services
│   ├── constants/                     # Colors, string constants, Firestore collections
│   ├── errors/                        # AppException error mapping
│   ├── routes/                        # Central routing configuration (AppRoutes)
│   ├── services/                      # AuthService, FirestoreService, StorageService, NotificationService
│   ├── theme/                         # Material 3 dark/light themes
│   └── utils/                         # TimestampHelper & date parsers
├── models/                            # Shared strongly-typed Firestore models
├── features/                          # Modular feature implementations
│   ├── auth/                          # Login, Registration & Role Selection
│   ├── home/                          # Stakeholder Dashboard
│   ├── land/                          # Land Leasing & Requests
│   ├── machinery/                     # Equipment Rental & Bookings
│   ├── workers/                       # Farm Workforce Directory
│   ├── marketplace/                   # Produce Marketplace & Orders
│   ├── consultants/                   # Expert Advisory & Appointments
│   ├── agriculture/                   # Smart Ag Updates & Scheme Alerts
│   └── notifications/                 # Notifications Center
└── widgets/                           # Reusable UI widgets
```

---

## Team Responsibilities

- **PERSON 1**: Authentication & User Module (`users`) — Login, Registration, Profiles & Dashboards.
- **PERSON 2**: Land, Worker & Machinery Module (`lands`, `land_requests`, `workers`, `machinery`, `machinery_requests`).
- **PERSON 3**: Marketplace, Consultant & Ag Updates (`products`, `orders`, `consultants`, `consultations`, `agriculture_updates`).
- **PERSON 4**: Firebase Backend, Integration & Admin (`notifications`, shared services, security rules, integration tests, admin tools).

> Detailed governance and data ownership rules are available in [`docs/TEAM_DEVELOPMENT.md`](file:///Users/sruthis/Desktop/Farmigo/Farmigooo/docs/TEAM_DEVELOPMENT.md).

---

## How to Run the Project

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run Static Code Analysis**:
   ```bash
   flutter analyze
   ```

3. **Run Unit & Widget Tests**:
   ```bash
   flutter test
   ```

4. **Launch Application**:
   ```bash
   # Run for Web
   flutter run -d chrome

   # Run for macOS Desktop
   flutter run -d macos
   ```

---

## How to Contribute & Git Workflow

All developers MUST work on dedicated feature branches before submitting Pull Requests:

1. **Pull Latest Changes**:
   ```bash
   git checkout main
   git pull origin main
   ```

2. **Create Feature Branch**:
   ```bash
   git checkout -b feature/<your-feature-name>
   ```

3. **Commit & Push**:
   ```bash
   git add .
   git commit -m "Add feature details"
   git push origin feature/<your-feature-name>
   ```

4. **Submit Pull Request**: Open a PR on GitHub to merge into `main`. Ensure `flutter analyze` passes cleanly.
