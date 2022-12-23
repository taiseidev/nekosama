import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nekosama/firebase_options_dev.dart' as dev;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');
  debugPrint('環境：$flavor');

  // Flavor に応じた FirebaseOptions を準備する
  // final firebaseOptions = flavor == 'prod'
  //     ? prod.DefaultFirebaseOptions.currentPlatform
  //     : dev.DefaultFirebaseOptions.currentPlatform;

  final firebaseOptions = dev.DefaultFirebaseOptions.currentPlatform;

  // Firebase の初期化
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
