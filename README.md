# Cine Lens 🎬

Cine Lens is an enterprise-grade, responsive mobile media exploration companion built with **Flutter**. The application provides film enthusiasts with a platform to discover movies and TV series, view deep analytical insights, browse technical cast/crew directories, manage user authentication, and stream media clips directly from **The Movie Database (TMDB) API**.

The application is engineered on top of a **Clean Architecture (Feature-by-Layer Separation)** paradigm using **Bloc/Cubit** for linear state propagation, **Dio** for advanced network interfaces, and **GetIt** for optimized dependency lifecycle injections.

---

## 🚀 Key Features

* **Secure TMDB Authentication Flow**: Seamless user validation leveraging web-view setups to handle request tokens, session ID transformations, and private user account caching profiles.
* **Comprehensive Movie Centre**: Distinct sections highlighting *Now Playing* (with responsive Carousel sliders), *Popular*, *Top Rated*, and *Upcoming* titles with optimized "See All" paginated grids.
* **Granular TV Series Hub**: Explorable vertical matrices mapping *Airing Today*, *On the Air*, *Top Rated*, and *Popular* TV properties supported by lazy load animations.
* **Granular Details View**: Displays media backdrops, movie ratings, technical production matrix badges, synopsis text block overviews, full cast & crew collection grids, and native video player modules for high-definition trailer streaming.
* **Intelligent Search Architecture**: Live search mechanism driven by a localized asynchronous `Debouncer` utility to preserve client resources and throttle excessive remote infrastructure queries.
* **Premium Presentation Design**: Fully custom dark-themed aesthetics utilizing robust typography scales configured with the premium *Montserrat* font family, asynchronous layout placeholders (custom Shimmers), and fluid native components.

---

## 🛠 Technology Stack & Architecture

Cine Lens implements a decoupled **Clean Architecture** framework, where every functional feature context maps isolated sub-domains (`data`, `domain`, and `presentation`) to separate data management from visual display components.

| Component Layer | Technology Framework | Operational Responsibility |
| :--- | :--- | :--- |
| **Core Framework** | Flutter SDK & Dart | Universal engine backing unified builds across Android and iOS. |
| **State Management** | Flutter BLoC / Cubits | Unidirectional streams emitting definitive, type-safe screen updates (`Loading`, `Success`, `Error`). |
| **Dependency Injection**| GetIt | Central service locator mapping singletons for repositories, API data sources, and client instances. |
| **Networking & HTTP** | Dio Client / Factory | Configured connection timeouts, error deserialization models (`ApiErrorHandler`), and clean request builders. |
| **Local Storage** | Flutter Secure Storage / Prefs| Encrypted and standard persistent local caching layers for session credentials and user settings. |
| **UI Responsiveness** | Flutter ScreenUtil | Scales widget parameters automatically across varying mobile screen aspects (Design base: 375x812). |

---

## 📂 Directory Structure Overview

The structural decomposition inside `lib/` details modular independence:

```text
lib/
├── core/                         # Shareable domain utilities and infrastructure components
│   ├── di/                       # Dependency registration hub via GetIt Service Locator
│   ├── enums/                    # Unified domain classification maps (Categories)
│   ├── helpers/                  # Asynchronous Debouncers, Extension maps, and storage handlers
│   ├── networking/               # Base Dio client engines, error models, and unified ApiResult wraps
│   ├── routing/                  # Central declarations mapping strongly-typed app navigation routes
│   ├── themes/                   # Unified Material 3 configurations and custom dark typography tables
│   └── widgets/                  # Agnostic reusable interface layout elements
└── features/                     # Distinct business feature contexts split into independent layers
    ├── home/                     # Base shell configuration layer managing primary navigation items
    ├── login/                    # Authenticators handling web verification tokens and session IDs
    ├── movie_details/            # Video view states, cast lists, crews grids, and production entities
    ├── movies/                   # Now Playing lists, Carousels, and category separation modules
    ├── search_movies/            # Search implementations optimized with data request throttling
    └── series/                   # TV exploration interfaces, layouts, and custom TV aggregators
