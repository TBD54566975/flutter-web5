import 'package:flutter/material.dart';
import 'package:wallet_exp/iawv_page.dart';

// InAppLocalhostServer localhostServer = InAppLocalhostServer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // localhostServer.start();

  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const IAWVPage(),
    ),
  );
}
