import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const Loading(), // '/' is the default route
      '/home': (context) => const Home(),
    }),
  );
}
