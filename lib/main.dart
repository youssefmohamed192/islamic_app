import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/ui/screens/details_screen/details_screen.dart';
import 'package:islamic_app/ui/screens/home/home_screen.dart';
import 'package:islamic_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("ar")],
      locale: Locale(provider.curLocale),
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        DetailsScreen.routeName : (_) => DetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}