import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goers_assessment/core/base_widgets/base_appbar.dart';
import 'package:goers_assessment/core/base_widgets/infinity_scroll_list_view.dart';
import 'package:goers_assessment/core/ext/ctx_ext.dart';
import 'package:goers_assessment/core/theme/color_theme.dart';
import 'package:goers_assessment/features/species/presentation/species_detail/species_detail_screen.dart';

import '../../../../core/base_widgets/buttons/primary_button.dart';
import '../../../../core/service_locator/injector.dart';
import '../../domain/entity/species.dart';
import 'cubit/species_list_cubit.dart';
part 'widgets/error.dart';
part 'widgets/list.dart';
part 'widgets/loading.dart';

class SpeciesListScreen extends StatelessWidget {
  static const routeName = "/user-list";
  const SpeciesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpeciesListCubit>()..getSpecies(),
      child: Builder(builder: (ctx) {
        final cubit = ctx.read<SpeciesListCubit>();
        final controller = InfinityScrollController<Species>(
            onGetMoreItem: cubit.getSpecies, onRefresh: cubit.onRefresh);
        return Scaffold(
          appBar: BaseAppBar(context, title: "Species List"),
          body: BlocListener<SpeciesListCubit, SpesciesListState>(
              listener: (context, state) {
                state.doWhen(onLoading: () {
                  controller.toggleLoading(true);
                }, onSuccess: (state) {
                  controller.addItem(state.speciesList.data,
                      hasMoreItem: state.speciesList.hasNextPage);
                });
              },
              child: _SpeciesList(controller: controller)),
        );
      }),
    );
  }
}
