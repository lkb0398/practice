import 'package:vitameal/domain/entity/diseases_entity.dart';

abstract interface class DiseasesRepository {
  Future<List<DiseasesEntity>> getAllDiseases();
  Future<List<int>> findDiseaseIdsByNames(List<String> names);
  Future<List<String>> findDiseaseNamesByIds(List<int> ids);
}
