import 'package:coffee_app/application_theme.dart';
import 'package:coffee_app/bloc_providers.dart';
import 'package:coffee_app/l10n/generated/l10n.dart';
import 'package:coffee_app/presentation/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviders.multiBlocProviders(
      child: MaterialApp(
        title: 'Coffee App',
        theme: ApplicationTheme.themeApp(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: const MainMenu(),
      ),
      context: context,
    );
  }
}
