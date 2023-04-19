import 'package:flutter/material.dart';
import 'package:my_bingo/pages/gameScreen.dart';
import 'package:my_bingo/pages/homeScreen.dart';
import 'package:my_bingo/pages/loadingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Roboto',
    ),
    initialRoute: '/home',
    routes: {
      '/': (context) => const LoadingScreen(),
      '/home': (context) => const HomeScreen(),
      '/game': (context) => GameScreen(),
    },
  ));
}
