import 'package:flutter/material.dart';

import 'config/palette.dart';
import 'navigation/animated_route_builder.dart';
import 'navigation/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  RouteFactory _getRouteFactory(Map<String, Widget> pages) {
    return (RouteSettings settings) => AnimatedRouteBuilder(
        settings: settings, page: pages[settings.name] ?? Container());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final genRoute = _getRouteFactory(pages(context));
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru')
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: genRoute,
      // home: const Navigator(initialRoute: Routes.home, onGenerateRoute: _onGenerateRoute(pages),),
    );
  }
}
