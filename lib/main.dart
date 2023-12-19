import 'package:flutter/material.dart';
import 'package:islamic_app/ui/screens/details_screen/details_screen.dart';
import 'package:islamic_app/ui/screens/home/home_screen.dart';
import 'package:islamic_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        DetailsScreen.routeName : (_) => DetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}