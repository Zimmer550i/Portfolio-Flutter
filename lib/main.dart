import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_flutter/services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _settings = SettingsProvider();

  @override
  void dispose() {
    _settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _settings,
      builder: (context, _) {
        return SettingsScope(
          settings: _settings,
          child: MaterialApp(
            title: 'Zimmer550i',
            debugShowCheckedModeBanner: false,
            scrollBehavior:
                const MaterialScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.invertedStylus,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.unknown,
            }),
            theme: buildLightTheme(_settings.accentColor),
            darkTheme: buildDarkTheme(_settings.accentColor),
            themeMode: _settings.themeMode,
            home: const App(),
          ),
        );
      },
    );
  }
}
