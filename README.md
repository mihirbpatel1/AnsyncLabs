# Grocery List App

A simple grocery list app built using Flutter, designed to add, edit, and remove items, with state persistence and an intuitive user interface.

## Features

- Add items to the grocery list
- Edit existing items
- Remove items from the list
- Persistent state: retains the list items even after the app is closed
- Follows the BLoC (Business Logic Component) pattern for state management
- Drag-and-drop reordering of items for better organization

## Requirements

- Flutter SDK
- Dart SDK

## Libraries Used

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management using BLoC pattern
- [shared_preferences](https://pub.dev/packages/shared_preferences): Persistent storage

## Getting Started

### Prerequisites

Ensure you have Flutter and Dart installed on your machine. You can download them from [Flutter](https://flutter.dev/docs/get-started/install) and [Dart](https://dart.dev/get-dart).

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/grocery_list_app.git
   cd grocery_list_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

   For a release build on Android:

   ```bash
   flutter build apk --release
   ```

   The APK file will be located at `build/app/outputs/flutter-apk/app-release.apk`.

### Directory Structure

```
lib/
|-- bloc/
|   |-- grocery_bloc.dart
|   |-- grocery_event.dart
|   |-- grocery_state.dart
|
|-- models/
|   |-- grocery_item.dart
|
|-- screens/
|   |-- grocery_list_screen.dart
|
|-- main.dart
```

### Code Overview

- **BLoC**: Contains the business logic component classes.
  - `grocery_bloc.dart`: Manages the state and events of the grocery list.
  - `grocery_event.dart`: Defines events for the grocery list.
  - `grocery_state.dart`: Manages the state of the grocery list.
- **Models**: Contains data models.
  - `grocery_item.dart`: Model class for grocery items.
- **Screens**: Contains UI components.
  - `grocery_list_screen.dart`: The main screen for displaying and interacting with the grocery list.
- **main.dart**: Entry point of the app.

### Usage

1. **Adding Items**
   - Tap the "+" icon to add a new grocery item.
   - Enter the item name and quantity, then tap "Save".

2. **Editing Items**
   - Tap on an item to edit its name and quantity.
   - Make the changes and tap "Save".

3. **Removing Items**
   - Swipe left on an item to remove it from the list.
