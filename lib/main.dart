import 'package:coffee_app/application_theme.dart';
import 'package:coffee_app/bloc_providers.dart';
import 'package:coffee_app/localization.dart';
import 'package:coffee_app/presentation/screens/main_menu.dart';
import 'package:coffee_app/service_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceProviders.multiServiceProvider(
      child: BlocProviders.multiBlocProviders(
        child: MaterialApp(
          title: 'Coffee App',
          theme: ApplicationTheme.themeApp(),
          localizationsDelegates: const [
            Localization.delegate,
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
      ),
      context: context,
    );
  }
}
