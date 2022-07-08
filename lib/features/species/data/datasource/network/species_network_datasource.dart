import 'package:dio/dio.dart';
import 'package:goers_assessment/core/util/resource.dart';
import 'package:goers_assessment/features/species/data/model/species_model.dart';

abstract class SpeciesNetworkDatasource {
  Future<PagedResource<SpeciesModel>> getAllSpecies({int page = 1});
}

class SpeciesNetworkDatasourceImpl implements SpeciesNetworkDatasource {
  final Dio _dio;

  SpeciesNetworkDatasourceImpl(this._dio);

  @override
  Future<PagedResource<SpeciesModel>> getAllSpecies({int page = 1}) async {
    print("https://swapi.dev/api/species/?page=$page");
    await Future.delayed(const Duration(seconds: 2));
    final response =
        await _dio.get("https://swapi.dev/api/species/?page=$page");
    return PagedResource(
        data: (response.data["results"] as List)
            .map((e) => SpeciesModel.fromJSON(e))
            .toList(),
        currentPage: page,
        hasNextPage: response.data["next"] != null);
  }
}
