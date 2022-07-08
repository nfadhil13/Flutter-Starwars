import 'package:flutter/material.dart';
import 'package:goers_assessment/core/theme/text_theme.dart';
import 'package:goers_assessment/features/species/presentation/species_detail/species_detail_screen.dart';
import 'package:goers_assessment/features/splash/presentation/splash_screen.dart';

import 'core/service_locator/injector.dart';
import 'features/species/presentation/species_list/species_detail_screen.dart';

void main() async {
  await InjectionContainer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goers Assessment',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: const AppTextTheme()),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SpeciesDetailScreen.routeName: (context) => const SpeciesDetailScreen(),
        SpeciesListScreen.routeName: ((context) => const SpeciesListScreen())
      },
    );
  }
}
