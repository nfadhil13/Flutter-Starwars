import 'package:flutter/material.dart';
import 'package:goers_assessment/core/ext/ctx_ext.dart';
import 'package:goers_assessment/core/theme/color_theme.dart';
import 'package:goers_assessment/features/species/domain/entity/species.dart';

import '../../../../core/base_widgets/base_appbar.dart';

class SpeciesDetailScreen extends StatelessWidget {
  static const routeName = "/species-detail-screen";
  const SpeciesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacing = SizedBox(height: 20);
    final species = context.navigationArgs as Species;
    return Scaffold(
      backgroundColor: ColorTheme.surface,
      appBar: BaseAppBar(context, title: "Species List"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ListView(
          children: [
            _Header(name: species.name),
            spacing,
            _Item(title: "Name", item: species.name),
            spacing,
            _Item(title: "Classification", item: species.classification),
            spacing,
            _Item(title: "Average Lifespan", item: "${species.averageLifespan} years"),
            spacing,
            _Item(title: "Average Height", item: "${species.averageHeight} cm"),
            spacing,
            _Item(title: "Language", item: species.language),
            spacing,
            _Item(title: "Eye Colors", item: species.eyeColors),
            spacing,
            _Item(title: "Hair Colors", item: species.hairColors)
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String item;
  const _Item({Key? key, required this.title, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelMedium?.copyWith(
              fontSize: 16,
              color: ColorTheme.primary,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          item,
          style: context.textTheme.labelLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String name;
  const _Header({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorTheme.primary,
              radius: 50,
              child: Text(
                name[0],
                style: context.textTheme.labelLarge
                    ?.copyWith(color: ColorTheme.onPrimary, fontSize: 40),
              )),
        ],
      ),
    );
  }
}
