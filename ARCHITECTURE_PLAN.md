# Churo Mobile White Label - Architecture Plan

## 1. Introduction
This document outlines the architectural foundation for "Churo Mobile", a white-label mobile application for mountain sports events (MTB/Running). The application is designed to be highly dynamic, consuming a JSON configuration to dictate its theme (colors, logos) and endpoints, while maintaining robust performance in low-connectivity mountain environments.

## 2. Core Architecture: Clean Architecture
The project will strictly adhere to Clean Architecture principles to ensure scalability, testability, and separation of concerns.

### 2.1. Layers
1.  **Domain Layer (Innermost):**
    *   **Responsibility:** Contains the core business logic, Use Cases, and Entities.
    *   **Rule:** Must be completely independent. It knows nothing about UI, external APIs, databases, or JSON serialization.
2.  **Data Layer:**
    *   **Responsibility:** Handles data retrieval and storage. Implements the repository interfaces defined in the Domain layer.
    *   **Components:** Data Sources (Remote APIs, Local Storage), Data Models (JSON serialization), and Repositories.
3.  **Presentation Layer (Outermost):**
    *   **Responsibility:** UI and state management.
    *   **Pattern:** BLoC (Business Logic Component).

## 3. State Management & Offline-First Strategy
Given the nature of mountain sports events, the app must function reliably in areas with poor or no internet connectivity.

### 3.1. BLoC Pattern
*   We will use the **BLoC** pattern for predictable and scalable state management.

### 3.2. Aggressive Local Caching
*   **Strategy:** Any JSON configuration, BLoC state, and essential assets must be cached locally immediately upon retrieval.
*   **Tools:** We will utilize **`hydrated_bloc`** and/or **`hive`** to persist the application state and data layer caching. This ensures the app can load instantly from the last known good state even without a network connection.

## 4. Dynamic Theming (White Label)
The application UI must adapt dynamically to the event's specific branding based on a backend payload.

### 4.1. ThemeBloc
*   **Mechanism:** A dedicated `ThemeBloc` will be responsible for managing the app's visual identity.
*   **Hydration:** The `ThemeBloc` will be hydrated from the initial JSON configuration provided by the backend.
*   **Strict Rule:** No colors, typography, or styling should be hardcoded in the Presentation layer. All UI components must listen to the `ThemeBloc` and apply the active `ThemeData`.

## 5. User Experience & In-App Content
To maximize user retention and provide a seamless experience, we will keep users within the app ecosystem as much as possible.

### 5.1. WebViews for Third-Party Content
*   **Mechanism:** All external content (e.g., registration forms, live results, informational PDFs, sponsor pages) MUST be rendered internally using `webview_flutter`.
*   **Routing Rule:** NEVER navigate the user out of the application to a system browser unless it is for explicit native actions that cannot be handled in-app (e.g., opening WhatsApp, opening Google Maps for navigation, or triggering the native Share sheet).

## 6. Development Workflow (Agentic-First)
*   **Planning:** Before implementing any new feature or structural change, an Implementation Plan artifact must be generated and approved.
*   **Dependencies:** All dependencies must be explicitly defined and verified; no assumptions should be made about pre-existing packages.

## 7. Recommended Initial Tech Stack & Dependencies
*   **State Management:** `flutter_bloc`, `hydrated_bloc`
*   **Local Storage/Caching:** `hive`, `hive_flutter`, `path_provider`
*   **Networking:** `dio` or `http` (with interceptors for caching logic)
*   **Data Serialization:** `json_annotation`, `json_serializable`
*   **Dependency Injection:** `get_it`
*   **In-App Browsing:** `webview_flutter`
*   **Routing:** `go_router` (recommended for handling deep links and dynamic routing)

---
*Documented generated according to Churo Mobile Flutter Architect principles.*
