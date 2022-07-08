import 'package:flutter/material.dart';
import 'package:goers_assessment/core/ext/ctx_ext.dart';
import 'package:goers_assessment/core/theme/color_theme.dart';
import 'package:goers_assessment/features/species/presentation/species_list/species_detail_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  void navigateToDetail(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 2));
    ctx.navigator.popAndPushNamed(SpeciesListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    navigateToDetail(context);
    return Scaffold(
      backgroundColor: ColorTheme.primary,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset("assets/starwars.png"),
        ),
      ),
    );
  }
}
