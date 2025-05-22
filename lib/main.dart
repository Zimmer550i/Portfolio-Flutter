import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    const firebaseConfig = {
      "apiKey": "AIzaSyAdeHUOivReAx9LXQVDpWDTJd7-Ax-TIs8",
      "authDomain": "swajan-portfolio.firebaseapp.com",
      "projectId": "swajan-portfolio",
      "storageBucket": "swajan-portfolio.firebasestorage.app",
      "messagingSenderId": "192953992285",
      "appId": "1:192953992285:web:b59d77c0c800fc05eb39b4",
      "measurementId": "G-7TBM4ELNM8",
    };

    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: firebaseConfig["apiKey"]!,
        authDomain: firebaseConfig["authDomain"]!,
        projectId: firebaseConfig["projectId"]!,
        storageBucket: firebaseConfig["storageBucket"]!,
        messagingSenderId: firebaseConfig["messagingSenderId"]!,
        appId: firebaseConfig["appId"]!,
        measurementId: firebaseConfig["measurementId"]!,
      ),
    );
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zimmer550i',
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.unknown,
      }),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.backgroundColor),
      home: const App(),
    );
  }
}
