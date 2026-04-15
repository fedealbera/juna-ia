# Project Context: Churo Mobile White Label

## 📋 Status Overview
**Current Version:** 0.1.0
**Architectural Pattern:** Clean Architecture (Domain, Data, Presentation)
**Primary Dev Focus:** UI Layer data binding to settings (ThemeBloc) & Dynamic layout mapping.

## 🎯 Functional Overview & Features
Churo Mobile is a **dynamic white-label platform** tailored for mountain sporting events (like MTB and Trail Running). Its primary purpose is to be the central digital hub for event participants and attendees.

**Core Functional Capabilities:**
- **Dynamic White-Labeling (Multi-Tenant):** The application completely transforms its visual identity (logos, typography, color palettes) based on a remote configuration payload for a specific organization (`idOrganizacion`) or event (`eventoId`).
- **Offline-First Resilience:** Recognizing that mountain races often lack cellular coverage, the app aggressively caches core configurations, schedules, and theme data locally. This ensures critical event info is always accessible offline.
- **Unified In-App Ecosystem:** External resources (e.g., race registration forms, live chronological results, PDFs, technical guides, sponsor pages) are loaded seamlessly inside native WebViews to maximize user retention. The user only leaves the app for actions better handled by the OS (WhatsApp coordination, Google Maps navigation, or native sharing).
- **Centralized Event Hub:** Acts as the primary tool for itineraries, rules, news, and emergency contacts.

## 🏗️ Architecture Summary
- **Clean Architecture Implementation**: The structure for the `Config` feature has been fully established (`domain/entities`, `domain/repositories`, `data/models`, `data/datasources`, `data/repositories`, and `usecases`).
- **Dependency Injection**: `GetIt` configured to provide UseCases, Repositories, BLoCs, and Dio for Networking. 
- **Offline-First Strategy**: Successfully implemented overriding `main.dart`. App state is persisted across reloads using `HydratedBloc` and remote API configs are smartly cached offline with `Hive`.
- **Legacy Components Integration**: Successfully migrated all 17 legacy data models to `lib/core/models/legacy` and the legacy Network Provider API endpoints into `lib/core/network/legacy_provider.dart` for future incremental transition.
- **Dynamic Theming**: `ThemeBloc` is converted to HydratedBloc but still using mock hardcoded colors. Needs data flow from data layer.

## 🛠️ Stack & Dependencies
- **State Management**: `flutter_bloc`, `hydrated_bloc`, `equatable`
- **Persistence**: `hive`, `hive_flutter`, `path_provider`
- **DI**: `get_it`
- **Networking**: `dio`, `http` (for legacy provider transition)
- **UI/Browsing**: `webview_flutter`, `url_launcher`

## 🚀 Execution Backlog
### Phase 1: Infrastructure (Completed)
- [x] Initialize `Hive` and `HydratedBloc` in `main.dart`.
- [x] Set up `GetIt` for dependency injection.
- [x] Refactor `ThemeBloc` to `HydratedBloc` for state persistence.

### Phase 2: Dynamic Branding & Config (In Progress)
- [x] Create `AppConfig` / `SettingEntity` and models for white-labeling.
- [x] Implement RemoteConfigSource (Dio & legacy HTTP provider maps).
- [x] Build `ConfigRepository` with offline caching capability using `Hive`.
- [ ] Connect `GetSettingsUseCase` inside `ThemeBloc` to load real branding parameters instead of Mocks.

### Phase 3: Core UI Framework
- [ ] Implement generic `ChuroWebView`.
- [ ] Set up `GoRouter` for dynamic routing based on configuration.
- [ ] Define the primary Layout and Theme templates.

## ⚠️ Known Gaps / Technical Debt
- No unit or widget tests implemented yet.
- Asset management strategy (logo/icons) via JSON config is pending.
- Ensure all multi-tenant (`ddln`-specific) identifiers link correctly with the legacy models (`idOrganizacion` / `eventoId`).

---
*Last update: April 06, 2026*
