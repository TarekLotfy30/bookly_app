# :blue_book: Bookly App: A Book Discovery App

Discover a world of knowledge with Bookly, offers free books , allowing you to preview their content and search for the book you need 📚✨

---

## :memo: Overview

Bookly is a sleek and intuitive Flutter application for book lovers, offering free access to discover, search, and preview a vast collection of books from the Google Books API. Built with a modern tech stack and a clean, scalable architecture, Bookly provides a seamless and responsive user experience.

---

### 📸 Screenshots

<!-- <div align="center"><img src="https://github.com/user-attachments/assets/10dc4aaa-6ccd-405c-b9db-e332644a0df7" width="205"></div> -->

| Splash Screen                      |Home                            |Search      |
|------------------------------------|--------------------------------|------------|
|<div align="center"><img src="https://github.com/TarekLotfy30/bookly_app/assets/117456407/ebf2476b-19df-48bf-9e90-994e4447e912" width="205"></div>                                   |<div align="center"><img src="https://github.com/user-attachments/assets/10dc4aaa-6ccd-405c-b9db-e332644a0df7" width="205"></div>                                |            |

| Book Details                       |Preview Book                    |
|------------------------------------|--------------------------------|
|<div align="center"><img src="https://github.com/TarekLotfy30/bookly_app/assets/117456407/72f2d607-c1e4-44c0-910e-5b7984b30ac3" width="205"></div>                                    |<div align="center"><img src="https://github.com/TarekLotfy30/bookly_app/assets/117456407/0d86bded-734b-48f8-813f-92b224958e7c" width="205"></div>                               |

---

### 📲 Features

- **Splash Screen**: A welcoming first glance.
- **Home Page**: Browse featured books in an auto-playing carousel and scroll through a list of the newest additions.
- **Detailed Book Views**: Get in-depth information about each book, including the author, ratings, and category
- **Free Previews**: Access book previews via external links, allowing users to sample content before they commit.
- **Search Functionality**: Find books with ease using the integrated search functionality.
- **UI/UX**: Enjoy a smooth, visually appealing interface with a dark theme, shimmer loading effects, and fluid animations .
- **Responsive Design**: A consistent experience across different screen sizes.

---

### :computer: Architecture & Technical Stack

- **Core Framework**: Flutter
- **Architecture**: Clean Architecture (Presentation, Domain, Data)
- **Presentation Pattern**: MVVM with Cubits as ViewModels
- **State Management**: Cubit (BLoC) with unidirectional data flow
- **Design Pattern**: Repository Pattern with abstraction layer
- **Dependency Injection**: get_it (Service Locator)
- **Networking**: Dio HTTP client with interceptors & DioException handling
- **Error Handling**: Functional approach using dartz (Either)
- **Local Storage**: Hive (lightweight NoSQL database)
- **Navigation**: go_router (Declarative & URL-based routing)
- **Testing**: Unit testing with flutter_test & mocktail
- **Version Control**: Git workflow with structured branching & semantic commits
- **UI Engineering**: Reusable components, animations, optimized image caching

---

### :package: Key Packages

<<<<<<< HEAD
| Package                | Description                          |
| ---------------------- | ------------------------------------ |
| `flutter_bloc`         | BLoC/Cubit state management          |
| `bloc`                 | Core BLoC library                    |
| `equatable`            | Value comparison helper              |
| `dartz`                | Functional error handling            |
| `get_it`               | Dependency injection locator         |
| `dio`                  | HTTP client                          |
| `pretty_dio_logger`    | Network request logger               |
| `go_router`            | Declarative routing                  |
| `cached_network_image` | Image caching                        |
| `carousel_slider`      | Image slider                         |
| `infinite_carousel`    | Infinite carousel widget             |
| `animated_text_kit`    | Text animations                      |
| `shimmer`              | Loading shimmer effect               |
| `hive`                 | Lightweight local database           |
| `hive_flutter`         | Hive Flutter integration             |
| `google_fonts`         | Custom fonts                         |
| `font_awesome_flutter` | Icon pack                            |
| `url_launcher`         | Open external links                  |
| `cupertino_icons`      | iOS style icons                      |

<details>
<summary> Full pubspec.yaml dependencies </summary>

```yaml
# State Management
  flutter_bloc: ^9.1.1       # BLoC/Cubit state management
  bloc: ^9.2.0               # Core BLoC library
  equatable: ^2.0.8          # Simplifies state/model comparison
  dartz: ^0.10.1             # Functional programming (Either/Error handling)

  # Dependency Injection
  get_it: ^9.2.0             # Service locator / DI

  # Networking
  dio: ^5.4.3+1              # HTTP client
  pretty_dio_logger: ^1.3.1  # Logs network requests/responses
  url_launcher: ^6.3.2       # Open external links

  # Routing
  go_router: ^17.0.1         # Declarative routing & deep linking

  # UI & Animations
  animated_text_kit: ^4.3.0  # Pre-built text animations
  carousel_slider: ^5.1.1    # Image slider component
  infinite_carousel: ^1.1.1  # Infinite carousel widget
  shimmer: ^3.0.0            # Loading placeholders

  # Images
  cached_network_image: ^3.4.1 # Efficient image caching

  # Fonts & Icons
  google_fonts: ^7.1.0        # Custom fonts
  font_awesome_flutter: ^10.12.0 # Icon pack
  cupertino_icons: ^1.0.8     # iOS system icons

  # Local Storage
  hive: ^2.2.3               # Lightweight DB
  hive_flutter: ^1.1.0       # Hive integration with Flutter
  ```

</details>

---

## 📁 Project Structure

```yaml
.
└── lib
    ├── core/           
    │   ├── di/          # Dependency Injection setup (get_it).
    │   ├── errors/      # Custom failure classes.
    │   ├── routes/      # GoRouter configuration.
    │   ├── services/    # API service (Dio) and local storage (Hive).
    │   └── widgets/     # Common reusable widgets.
    ├── features/        
    │   └── home/        # Example: Home feature.
    │       ├── data/    # Data sources, models, repo implementation.
    │       ├── domain/  # Entities, repository interfaces, use cases.
    │       └── presentation/ # Cubits, views,feature-specific widgets.
    └── main.dart        # App entry point.
  ```

---
