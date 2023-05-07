import 'dart:async';
import 'dart:convert';

import 'package:app_b/firebase_options.dart';
import 'package:app_b/modals/index.dart';
import 'package:app_b/view/components/a_components.dart';
import 'package:app_b/view/pages/pages.dart';
import 'package:app_b/view/utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const MyApp());
    } else {
      await Firebase.initializeApp(
        name: "Al-fatiha",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const MyApp());
    }
  } catch (e) {
    print('Something wrong $e');
    return;
  }
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Al-Fatiha',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
              ),
              iconButtonTheme: IconButtonThemeData(
                style: IconButton.styleFrom(
                  highlightColor: Colors.green,
                  backgroundColor: Colors.green,
                  focusColor: Colors.green,
                  hoverColor: Colors.green,
                  shadowColor: Colors.green,
                  foregroundColor: Colors.green,
                  surfaceTintColor: Colors.green,
                  disabledBackgroundColor: Colors.green,
                  disabledForegroundColor: Colors.green,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.green,
              ),
              sliderTheme: const SliderThemeData(
                thumbColor: Colors.green,
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.white,
              ),
            ),
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primaryColor: Colors.green,
                colorScheme: const ColorScheme.light(),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.green,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                ),
                sliderTheme: const SliderThemeData(
                  thumbColor: Colors.white,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                textTheme: const TextTheme(
                  titleLarge: TextStyle(color: Colors.black),
                  bodyLarge: TextStyle(color: Colors.black),
                  bodyMedium: TextStyle(color: Colors.black),
                  bodySmall: TextStyle(color: Colors.black),
                  displayLarge: TextStyle(color: Colors.black),
                  displayMedium: TextStyle(color: Colors.black),
                  displaySmall: TextStyle(color: Colors.black),
                  headlineLarge: TextStyle(color: Colors.black),
                  headlineMedium: TextStyle(color: Colors.black),
                  headlineSmall: TextStyle(color: Colors.black),
                  labelLarge: TextStyle(color: Colors.black),
                  labelMedium: TextStyle(color: Colors.black),
                  labelSmall: TextStyle(color: Colors.black),
                  titleMedium: TextStyle(color: Colors.black),
                  titleSmall: TextStyle(color: Colors.black),
                )),
            themeMode: currentMode,
            home: const MainPage(),
          );
        });
  }
}
