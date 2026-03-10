# Carai (문서 스캐너 앱)

종이 문서를 디지털화하고 관리하며 서버로 전송하는 전문적인 Flutter 프로젝트입니다. 이 프로젝트는 **iOS, Android 네이티브 앱**과 **모바일 웹(PWA)** 크로스 플랫폼을 모두 공식 지원합니다. 모든 플랫폼에서 일관된 모바일 화면 비율과 사용성을 제공하도록 설계되었습니다.

## 1. FVM (Flutter Version Management) 설정 및 사용

이 프로젝트는 개발 환경 간의 일관된 Flutter SDK 버전을 유지하기 위해 **FVM**을 사용합니다.

### 설치
FVM이 설치되어 있지 않다면, [공식 설치 가이드](https://fvm.app/documentation/getting-started/installation)를 참고하세요.

### 사용법
**모든 Flutter 및 Dart 명령어는 반드시 `fvm` 접두어를 붙여서 실행해야 합니다.** `flutter`나 `dart` 명령어를 직접 사용하지 마세요.

- **앱 실행 및 배포 (플랫폼별 Make 명령어 제공)**:
  ```bash
  make run_web      # 웹 브라우저 (CORS 제한 해제 상태)로 실행
  make run_android  # 연결된 안드로이드 기기/에뮬레이터로 실행
  make run_ios      # 연결된 iOS 기기/시뮬레이터로 실행
  make deploy_web   # 수동 Firebase 호스팅 배포 (웹 빌드 포함)
  ```
  > **참고**: `make deploy_web` 실행 전 터미널에서 `firebase login` 명령어를 통해 구글 계정 인증이 먼저 되어 있어야 합니다.
  
  *(위 명령어들은 실행 전 자동으로 `build_runner`를 수행하여 코드를 최신화합니다)*
- **패키지 가져오기**:
  ```bash
  fvm flutter pub get
  ```
  
- **코드 생성 (중요)**:
  `freezed`, `go_router_builder`, `riverpod_generator` 등을 사용하므로 아래 명령어를 통해 코드를 생성해야 합니다.
  ```bash
  fvm dart run build_runner build --delete-conflicting-outputs
  ```

---

## 2. 아키텍처 및 폴더 구조

본 프로젝트는 **Feature-first Clean Architecture**와 UI 레이어의 **Atomic Design** 원칙을 따릅니다.

### 폴더 구조
```plaintext
lib/
├── core/              # 글로벌 설정, 네트워크 (Dio), 라우팅 (GoRouter), 유틸리티, 에러 처리.
├── design_system/     # 비즈니스 로직과 분리된 순수 UI 컴포넌트.
│   ├── foundations/   # 색상, 타이포그래피, 간격 등 기본 정의.
│   ├── atoms/         # 가장 작은 단위의 컴포넌트 (버튼, 입력창 등).
│   ├── molecules/     # 원자들의 조합 (검색창 등).
│   └── organisms/     # 복잡한 UI 블록.
├── features/          # 기능 중심의 모듈화된 폴더.
│   └── <feature_name>/
│       ├── data/         # 리포지토리 구현체, 데이터 소스, DTO.
│       ├── domain/       # 리포지토리 인터페이스, 엔티티, 유즈케이스.
│       └── presentation/ # ViewModels (Riverpod), UI 화면.
├── app.dart           # 앱 레벨 위젯 (MaterialApp.router 설정).
└── main.dart          # 진입점 및 초기화 로직 (Hive 등).
```

### 핵심 아키텍처 개념
- **로컬 스토리지**: `Hive`를 사용하여 로컬 데이터를 저장합니다.
- **네트워크**: `Dio`와 인터셉터를 사용하여 API 통신을 처리합니다.
- **상태 관리**: `Riverpod` (StateNotifier/Notifier)를 사용합니다.
- **라우팅**: `GoRouter`와 `go_router_builder`를 통한 **완전한 타입 안정성(Type-safe)** 라우팅을 구현합니다.

---

## 3. Agent 개발 규칙 (Agent Rule)

이 프로젝트는 높은 코드 품질과 일관성을 유지하기 위해 엄격한 개발 규칙을 준수합니다.

- **로직 내 BuildContext 사용 금지**: ViewModel이나 Repository 내부에서 `BuildContext` 사용을 엄격히 금지합니다. 네비게이션이나 UI 알림은 `GlobalKey` 또는 Provider를 통해 처리합니다.
- **함수형 에러 처리**: `fpdart`를 사용하여 에러를 처리합니다. 예외(Exception)를 던지는 대신, 리포지토리는 `Either<Failure, T>`를 반환합니다.
- **엄격한 타입 체크**: `dynamic` 타입 사용을 금지합니다. 모든 변수와 함수 시그니처에는 명시적이고 엄격한 타입을 사용해야 합니다.
- **불변성(Immutability)**: `Freezed`를 사용하여 불변 데이터 구조와 `final` 필드 사용을 지향합니다.
- **Atomic Design 일관성**: `design_system`의 컴포넌트는 순수해야 하며, 특정 기능의 Provider에 의존하지 않고 오직 파라미터로만 데이터를 전달받습니다.

---

## 4. 디자인 리소스 (Design Resources)

프로젝트의 `designs` 폴더에 앱의 디자인 스크린샷과 html로 작성된 디자인 프로토타입이 포함되어 있습니다. 개발 및 유지보수 시 이 디자인 자료들을 참고하여 UI를 구현합니다.

---

## 5. Git 워크플로우 (Git Workflow)

안정적인 프로젝트 관리를 위해 다음의 브랜치 전략을 준수합니다.

- **Main 브랜치 직접 푸시 금지**: `main` 브랜치에 직접 커밋하거나 푸시하는 것은 **엄격히 금지**되어 있습니다.
- **Pull Request(PR) 및 빌드 테스트**: 모든 변경 사항은 Github에서 PR을 생성한 후, 자동화된 빌드 테스트를 통과해야만 `main` 브랜치에 머지될 수 있습니다.

---

## 지원 플랫폼
- [x] Android
- [x] iOS
- [x] Web (Mobile PWA)
- [ ] Desktop (비활성화)
