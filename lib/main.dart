import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';
import 'screens/new_clock_form.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const Loading(), // '/' is the default route
      '/home': (context) => const Home(),
      '/new_clock_form': (context) => const NewClockForm(),
    }),
  );
}
