import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:carai/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('authBox');
  await Hive.openBox('repairShopsBox');
  // Register Hive adapters here if needed

  runApp(const ProviderScope(child: CaraiApp()));
}
