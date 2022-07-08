import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goers_assessment/features/species/data/datasource/network/species_network_datasource.dart';
import 'package:goers_assessment/features/species/data/repositories/species_repository_impl.dart';
import 'package:goers_assessment/features/species/domain/repositories/species_repository.dart';
import 'package:goers_assessment/features/species/domain/usecases/get_all_species.dart';
import 'package:goers_assessment/features/species/presentation/species_list/cubit/species_list_cubit.dart';
final GetIt getIt = GetIt.instance;

class InjectionContainer {
  static Future<void> init() async {
    _injectCore();
    _injectBloc();
    _injectUseCase();
    _injectRepo();
    _injectDataSource();
  }
}

void _injectCore() {
  getIt.registerFactory(() => Dio());
}

void _injectBloc() {

  getIt.registerFactory(() => SpeciesListCubit(getIt()));
}

void _injectUseCase() {
  getIt.registerFactory(() => GetAllSpecies(getIt()));
}

void _injectRepo() {
  getIt.registerFactory<SpeciesRepository>(() => SpeciesRepositoryImpl(getIt()));
}

void _injectDataSource() {
  getIt.registerFactory<SpeciesNetworkDatasource>(
      () => SpeciesNetworkDatasourceImpl(getIt()));
}
