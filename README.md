📦 Inventory Management App (Flutter + Firebase)
🚀 Project Overview

This is a Flutter-based Inventory Management App integrated with Firebase Firestore. The app allows users to perform full CRUD operations (Create, Read, Update, Delete) on inventory items in real time using Firestore streams.

The UI updates automatically whenever data changes in the cloud.

🎯 Features
✅ Core Features
Add new inventory items
View real-time list of items (Firestore StreamBuilder)
Delete items from inventory
Form validation for all inputs (name, quantity, price)
Empty state & error handling
⭐ Enhanced Features (Add-ons)
Real-time updates using Firestore Streams
Low-stock detection (optional enhancement)
Clean architecture (Model + Service + UI separation)
🧱 Tech Stack
Flutter (Dart)
Firebase Core
Cloud Firestore
StreamBuilder (real-time UI updates)
📂 Project Structure
lib/
│
├── main.dart
├── models/
│   └── item_model.dart
├── services/
│   └── firestore_service.dart
└── screens/
    └── home_screen.dart
🔥 Firebase Setup
1. Add Firebase dependencies
firebase_core
cloud_firestore
2. Add Firebase config file

Place this file here:

android/app/google-services.json
3. Enable Firestore
Go to Firebase Console
Enable Firestore Database (test mode for development)
▶️ How to Run the App
Step 1: Clone repository
git clone <your-repo-url>
cd inventory_app
Step 2: Install dependencies
flutter pub get
Step 3: Run the app
flutter run

For Chrome:

flutter run -d chrome
🧠 Architecture Explanation

This project follows a simple clean architecture:

📌 Model Layer

Defines structure of inventory items.

📌 Service Layer

Handles all Firestore operations:

addItem()
getItems()
updateItem()
deleteItem()
📌 UI Layer
Uses StreamBuilder for real-time updates
Displays data using ListView.builder
Handles user input and validation
🔄 CRUD Operations
Operation	Description
Create	Add new inventory item
Read	Stream real-time data from Firestore
Update	Modify existing item
Delete	Remove item from database
🧪 Validation Rules
Name cannot be empty
Quantity must be a valid integer
Price must be a valid number