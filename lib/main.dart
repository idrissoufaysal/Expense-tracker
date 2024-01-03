import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var KColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: KColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: KColorScheme.onPrimaryContainer,
            foregroundColor: KColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: KColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: KColorScheme.onSecondaryContainer
                  ,
                  fontSize: 14)
                  )
                  ),
      
      home: const Expenses(),
    );
  }
}
