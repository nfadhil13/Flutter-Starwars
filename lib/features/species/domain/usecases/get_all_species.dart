import 'package:goers_assessment/features/species/domain/entity/species.dart';

import '../../../../core/util/resource.dart';
import '../repositories/species_repository.dart';

class GetAllSpecies {
  final SpeciesRepository _userRepository;

  GetAllSpecies(this._userRepository);
  Future<Resource<PagedResource<Species>>> execute({int page = 1}) => _userRepository.getAllSpecies(page: page);
}
