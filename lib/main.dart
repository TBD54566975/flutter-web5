import 'package:flutter/material.dart';
import 'package:wallet_exp/app.dart';

// InAppLocalhostServer localhostServer = InAppLocalhostServer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // localhostServer.start();

  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: const App(),
    ),
  );
}
