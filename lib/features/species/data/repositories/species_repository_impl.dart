import 'package:goers_assessment/core/util/base_repo.dart';
import 'package:goers_assessment/core/util/resource.dart';
import 'package:goers_assessment/features/species/data/datasource/network/species_network_datasource.dart';
import 'package:goers_assessment/features/species/domain/entity/species.dart';

import '../../domain/repositories/species_repository.dart';

class SpeciesRepositoryImpl extends BaseRepository
    implements SpeciesRepository {
  final SpeciesNetworkDatasource _networkDatasource;

  SpeciesRepositoryImpl(this._networkDatasource);
  @override
  Future<Resource<PagedResource<Species>>> getAllSpecies({int page = 1}) =>
      networkOnlyCall(networkCall: () async {
        return Resource.success(data: await _networkDatasource.getAllSpecies(page: page));
      });
}
