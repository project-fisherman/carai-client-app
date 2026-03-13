import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'core/config/env_config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드 시도 — 없으면 Firebase 비활성화
  try {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    EnvConfig.setFirebaseEnabled(true);
    debugPrint('✅ [ENV] .env 로드 성공 — Firebase 활성화');
  } catch (e) {
    debugPrint('⚠️ [ENV] .env 파일을 찾을 수 없습니다 — Firebase 비활성화: $e');
  }

  await Hive.initFlutter();
  await Hive.openBox('authBox');
  await Hive.openBox('repairShopsBox');
  await Hive.openBox('invitationBox');
  // Register Hive adapters here if needed

  runApp(const ProviderScope(child: CaraiApp()));
}
