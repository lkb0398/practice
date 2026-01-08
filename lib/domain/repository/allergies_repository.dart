import 'package:vitameal/domain/entity/allergies_entity.dart';

abstract interface class AllergiesRepository {
  Future<List<AllergiesEntity>> getAllAllergies();
  Future<List<int>> findAllergyIdsByNames(List<String> names);
  Future<List<String>> findAllergyNamesByIds(List<int> ids);
}
