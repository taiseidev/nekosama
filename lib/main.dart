import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/app.dart';
import 'package:nekosama/firebase_options/firebase_options_dev.dart' as dev;
import 'package:nekosama/firebase_options/firebase_options_prod.dart' as prod;
import 'package:nekosama/src/utils/logger.dart';
import 'package:nekosama/src/utils/provider_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');
  logger.i('環境：$flavor');

  await Future.wait([
    // 広告を初期化
    MobileAds.instance.initialize(),
    // Firebaseの読み込み
    setFirebase(flavor: flavor),
    // 画面の向きを固定
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  ]);

  runApp(
    ProviderScope(
      // Providerのライフサイクルを監視
      observers: [ProviderLogger()],
      child: const App(),
    ),
  );
}

Future<void> setFirebase({required String flavor}) async {
  final firebaseOptions = flavor == 'prod'
      ? prod.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions.currentPlatform;

  // Firebase の初期化
  await Firebase.initializeApp(options: firebaseOptions);
}
