/// .env 파일 로드 성공 여부에 따라 Firebase 사용 가능 여부를 관리하는 클래스입니다.
class EnvConfig {
  static bool _firebaseEnabled = false;

  /// Firebase가 초기화되었는지 여부를 반환합니다.
  static bool get isFirebaseEnabled => _firebaseEnabled;

  /// Firebase 활성화 여부를 설정합니다. main.dart에서만 호출합니다.
  static void setFirebaseEnabled(bool value) => _firebaseEnabled = value;
}
