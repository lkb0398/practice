import 'package:vitameal/data/data_source/diseases_data_source.dart';
import 'package:vitameal/data/mapper/diseases_mapper.dart';
import 'package:vitameal/domain/entity/diseases_entity.dart';
import 'package:vitameal/domain/repository/diseases_repository.dart';

class DiseasesRepositoryImpl implements DiseasesRepository {
  DiseasesRepositoryImpl(this.dataSource);

  final DiseasesDataSource dataSource;

  @override
  Future<List<DiseasesEntity>> getAllDiseases() async {
    final dtos = await dataSource.fetchAll();
    return dtos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<int>> findDiseaseIdsByNames(List<String> names) {
    return dataSource.findIdsByNames(names);
  }

  @override
  Future<List<String>> findDiseaseNamesByIds(List<int> ids) {
    return dataSource.findNamesByIds(ids);
  }
}
