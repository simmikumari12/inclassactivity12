# 📦 Inventory Management App (Flutter + Firebase)

## 🚀 Overview
This is a Flutter Inventory Management App that uses Firebase Firestore for real-time cloud database functionality. The app supports full CRUD operations and updates the UI instantly using StreamBuilder.

---

## 🎯 Features

### ✅ Core Features
- Add inventory items
- View real-time item list (Firestore Stream)
- Delete items
- Form validation (name, quantity, price)
- Empty and error state handling

### ⭐ Enhanced Features
- Real-time updates using Firestore Streams
- Clean architecture (Model, Service, UI separation)

---

## 🧱 Tech Stack
- Flutter (Dart)
- Firebase Core
- Cloud Firestore
- StreamBuilder (real-time UI updates)

---

## 📂 Project Structure
lib/
│
├── main.dart
├── models/
│ └── item_model.dart
├── services/
│ └── firestore_service.dart
└── screens/
└── home_screen.dart


---

## 🔥 Firebase Setup

### 1. Dependencies
Add in `pubspec.yaml`:
```yaml
firebase_core: ^latest
cloud_firestore: ^latest

## ▶️ How to Run
Step 1: Install dependencies
flutter pub get
Step 2: Run app
flutter run
For Chrome
flutter run -d chrome