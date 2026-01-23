---
trigger: always_on
---

# Carai Project Developer Rules

You are an expert Flutter developer working on **Carai**, a document scanner app for iOS and Android.
Your goal is to maintain a scalable, strictly typed codebase following Clean Architecture and Atomic Design.

## 1. Terminal & Execution Rules (CRITICAL)
- **FVM Enforcement**:
  - You **MUST** use `fvm` (Flutter Version Management) for ALL Flutter and Dart related commands.
  - **NEVER** execute `flutter <command>` or `dart <command>` directly.
  - **ALWAYS** prefix with `fvm`.
- **Common Commands**:
  - Run App: `fvm flutter run`
  - Get Packages: `fvm flutter pub get`
  - **Code Generation (Crucial)**: Whenever you modify Freezed models, Riverpod providers, or GoRouter routes, run:
    `fvm dart run build_runner build --delete-conflicting-outputs`

## 2. Project Architecture & File Structure
- **Feature-first Clean Architecture**:
  - `lib/features/<feature_name>/data`: Repositories, Data Sources, DTOs.
  - `lib/features/<feature_name>/domain`: Entities, Repository Interfaces, UseCases.
  - `lib/features/<feature_name>/presentation`: ViewModels (Riverpod), Screens, Widgets.
- **Atomic Design System (`lib/design_system/`)**:
  - `foundations`: Colors, Typography, Spacing.
  - `atoms`: Basic components (Buttons, Inputs).
  - `molecules`: Combinations of atoms (Search bars).
  - `organisms`: Complex UI blocks.
  - **RULE**: Components in `design_system` must be **PURE**. They **CANNOT** depend on Riverpod providers or Business Logic. Data must be passed via constructor parameters only.
- **Core**: Place global utilities, network (Dio), routing (GoRouter), and failure classes in `lib/core/`.

## 3. Tech Stack & Coding Standards
- **State Management**: Use **Riverpod** with `@riverpod` annotation (Code Generation). Prefer `Notifier` or `AsyncNotifier`.
- **Routing**: Use **GoRouter** with `go_router_builder` for **Type-safe routing**. Define routes in `lib/core/router/`.
- **Immutability**:
  - Use **Freezed** for all Data Classes, State classes, and Unions.
  - All class fields must be `final`.
- **Local Storage**: Use **Hive** for persisting local data.
- **Network**: Use **Dio** with Interceptors for API calls.

## 4. Error Handling & Logic Rules
- **Functional Error Handling (fpdart)**:
  - **NEVER** throw Exceptions in the Domain/Data layer.
  - Repositories must return `Future<Either<Failure, T>>` using `fpdart`.
  - Handle errors explicitly using `.fold()` in the Presentation layer.
- **No BuildContext in Logic**:
  - **STRICTLY FORBIDDEN**: Using `BuildContext` inside ViewModels, Notifiers, or Repositories.
  - Use GlobalKeys or Router Listeners for navigation/dialogs triggered by logic.
- **Strict Typing**:
  - **NEVER** use `dynamic`. Use explicit types or Generics.
  - Avoid casting (`as`). Use `is` checks.

## 5. Flutter Specifics
- **UI Composition**: Use `SizedBox` for spacing. Break down complex `build` methods into smaller Widgets.
- **Async/Await**: Always return `Future<void>` or `Future<T>` for async functions.
- **Target Platforms**: Focus on iOS and Android. Web and Desktop are disabled.
- **AppScaffold Usage**: You **MUST** use `AppScaffold` (from `design_system/molecules`) instead of `Scaffold` for all screens to ensure dynamic status bar coloring.

## 6. Code Style
- Follow Dart's official linting rules.
- Use `snake_case` for files and `PascalCase` for classes.
- Sort imports: Dart -> Package -> Project (Relative).

## 7. Design & Localization Rules
- **Design Implementation**:
  - The `designs` folder contains app design screenshots and HTML prototypes.
  - You **MUST** develop Flutter screens based on the HTML prototypes in the `designs` folder.
  - **Strictly adhere** to color values, spacing, and other metrics defined in the HTML.
- **Localization (Korean Only)**:
  - Even if the design prototypes or screenshots are in English, the actual app content **MUST BE in Korean**.
  - All UI text, error messages, and user-facing strings must be in Korean.

## 8. Server Side Reference Guidelines
- **Read-Only Access**:
  - The `server` folder contains the backend code and is included as a git submodule.
  - **NEVER** modify files inside the `server` directory. It is strictly for reference to understand the API and data structures.
- **Submodule Sync**:
  - When referencing `server` code for implementing new client features, **ALWAYS** update the submodule from the remote first to ensure you are looking at the latest backend logic.
  - Command: `git submodule update --remote --merge`