# Premium Product Catalog (Taks)

A modern, responsive Flutter application for browsing and managing a premium product catalog.

## Overview
This project is built using Flutter and follows a clean, modular architecture. It leverages **GetX** for state management, dependency injection, and routing, providing a highly performant and scalable solution.

## Core Features
- **Product Listing**: View a catalog of products fetched via REST API.
- **Product Details**: Detailed view for individual products.
- **Favorites Management**: Add or remove products from your favorites, with data persisted locally.
- **Premium UI**: Uses Material 3 design with a custom tailored color scheme and typography.

## Tech Stack & Packages
- **Framework**: [Flutter](https://flutter.dev/) (SDK ^3.11.5)
- **State Management & Routing**: `get` (^4.6.6)
- **Networking**: `http` (^1.2.1)
- **Local Storage**: `shared_preferences` (^2.2.3)
- **Icons**: `cupertino_icons` (^1.0.8)

## Project Structure
The `lib/` directory is organized into distinct layers to separate concerns using a modular architecture pattern. 

Here is a visual map of the core files:

```text
lib/
├── main.dart                             # Application entry point & Theme configuration
├── controllers/
│   ├── favorites_controller.dart         # GetX controller for managing favorite products state
│   └── product_controller.dart           # GetX controller for fetching and managing product data
├── data/
│   ├── models/
│   │   └── product_model.dart            # Data model representing a Product
│   ├── providers/
│   │   └── api_provider.dart             # API layer for executing HTTP requests to the backend
│   └── repositories/
│       └── product_repository.dart       # Repository layer to abstract data fetching from providers
├── utils/
│   └── local_storage.dart                # Utility for interacting with SharedPreferences (local data)
└── views/
    ├── product_details/
    │   └── product_details_screen.dart   # Screen displaying full details of a specific product
    └── product_list/
        ├── product_list_screen.dart      # Main screen displaying the catalog list
        └── widgets/
            ├── product_card.dart         # Reusable UI widget for individual products in the list
            └── search_bar_widget.dart    # Reusable UI widget for the search bar
```

## Getting Started

To run this project locally:

1. Ensure you have the Flutter SDK installed.
2. Clone the repository and navigate into the project directory.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run` on your preferred emulator or physical device.

---

### Resources
A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [GetX Documentation](https://pub.dev/packages/get)
