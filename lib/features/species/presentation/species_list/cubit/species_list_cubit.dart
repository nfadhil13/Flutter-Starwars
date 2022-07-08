import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goers_assessment/core/util/resource.dart';
import 'package:goers_assessment/features/species/domain/usecases/get_all_species.dart';

import '../../../domain/entity/species.dart';

part 'species_list_state.dart';

class SpeciesListCubit extends Cubit<SpesciesListState> {
  final GetAllSpecies _getAllSpecies;

  SpeciesListCubit(this._getAllSpecies)
      : super(SpesciesListState.success(PagedResource.start()));

  void getSpecies() async {
    if (state is Loading) return;
    final page = _getCurrentPage();
    emit(SpesciesListState.loading());
    final result = await _getAllSpecies.execute(page: page);
    result.whenWithResult(success: (data) {
      emit(SpesciesListState.success(data));
    }, error: (error) {
      emit(SpesciesListState.error("Failed To get spescies data"));
    });
  }

  void onRefresh() async {
    if (state is Loading) return;
    emit(SpesciesListState.loading());
    final result = await _getAllSpecies.execute(page: 1);
    result.whenWithResult(success: (data) {
      emit(SpesciesListState.success(data));
    }, error: (error) {
      emit(SpesciesListState.error("Failed To get spescies data"));
    });
  }

  int _getCurrentPage() {
    final currentState = state;
    if (currentState is! Success) return 1;
    return currentState.speciesList.currentPage + 1;
  }
}
