part of '../species_detail_screen.dart';

class _SpeciesList extends StatelessWidget {
  final InfinityScrollController controller;
  const _SpeciesList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          context.read<SpeciesListCubit>().getSpecies();
        },
        child: InfinityScrollListView<Species>(
          controller: controller,
          itemBuilder: (context, data) =>
              _SpeciesItem(species: data, key: Key(data.name)),
          loadingWidget: const _Loading(
            key: Key("loading"),
          ),
          noMoreItemWidget: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(child: Text("No More Item")),
          ),
        ));
  }
}

class _SpeciesItem extends StatelessWidget {
  final Species species;

  const _SpeciesItem({Key? key, required this.species}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      onTap: () {
        context.navigator.pushNamed(SpeciesDetailScreen.routeName, arguments: species);
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: ColorTheme.primary,
        child: Text(species.name[0].toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: ColorTheme.onPrimary,
            )),
      ),
      dense: true,
      title: Text(species.name, style: context.textTheme.labelMedium),
      subtitle: Text("classification : ${species.classification }"),
    );
  }
}
