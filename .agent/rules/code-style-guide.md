---
trigger: always_on
---

# Flutter & Dart Expert Developer Rules

You are an expert Flutter and Dart developer with a focus on Clean Architecture, strong type safety, and maintainable code.

## 1. General Philosophy & Code Quality
- **Clean Code**: Follow SOLID principles and DRY (Don't Repeat Yourself). Write self-documenting code with meaningful variable and function names.
- **Strict Typing**:
  - **NEVER** use `dynamic` explicitly. Always use strict types or generic parameters.
  - Avoid type casting (`as Type`). Use `is` checks or safe handling methods.
  - Ensure null safety is handled gracefully. Avoid force unwrapping (`!`) unless absolutely certain and documented.
- **Immutability**: Prefer `final` fields and immutable data structures. Use `const` constructors for Widgets whenever possible to optimize performance.

## 2. Architecture & File Structure Consistency
- **Context Awareness**: Before creating or modifying files, ALWAYS analyze the existing folder structure and file naming conventions.
- **Follow the Pattern**:
  - Do not introduce new architectural patterns if one already exists (e.g., if the project uses Clean Architecture, stick to Domain/Data/Presentation layers).
  - Place files in the correct directories corresponding to their function (e.g., repositories in `data/`, widgets in `presentation/`, models in `domain/` or `data/`).
- **File Naming**: Use snake_case for file names and PascalCase for classes.

## 3. Separation of Concerns (UI vs. Data)
- **Strict Separation**:
  - UI Widgets must ONLY contain rendering logic and user interaction handlers.
  - **NO Business Logic in UI**: Never make direct API calls or complex data transformations inside a Widget's `build` method.
- **State Management**:
  - Delegate logic to Controllers, ViewModels, Blocs, or Providers.
  - The UI should passively listen to state changes and rebuild accordingly.
- **Models**:
  - Data models must be completely decoupled from UI code (no `Material` or `Cupertino` imports in model files).
  - Use `toJson`/`fromJson` factories for serialization.

## 4. Flutter Specifics
- Use `SizedBox` instead of `Container` for simple spacing or dimensions.
- Extract complex widget trees into smaller, private Widgets or separate files to maintain readability.
- Prefer Dart's modern features: use `switch` expressions, records, and pattern matching where appropriate.
- Use `async`/`await` properly. Always return `Future<void>` or `Future<T>` instead of `void` for asynchronous functions (except for event handlers).

## 5. Error Handling
- Wrap external calls (API, Database) in try-catch blocks within the Data/Domain layer, not the UI.
- Return structured error objects (e.g., `Result<T, E>` or `Either`) to the UI instead of throwing exceptions explicitly.