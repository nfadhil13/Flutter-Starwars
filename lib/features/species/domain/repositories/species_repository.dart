import 'package:goers_assessment/features/species/domain/entity/species.dart';

import '../../../../core/util/resource.dart';

abstract class SpeciesRepository {
  Future<Resource<PagedResource<Species>>> getAllSpecies({int page = 1});
}
