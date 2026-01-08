import 'package:vitameal/data/data_source/allergies_data_source.dart';
import 'package:vitameal/data/mapper/allergies_mapper.dart';
import 'package:vitameal/domain/entity/allergies_entity.dart';
import 'package:vitameal/domain/repository/allergies_repository.dart';

class AllergiesRepositoryImpl implements AllergiesRepository {
  AllergiesRepositoryImpl(this.dataSource);

  final AllergiesDataSource dataSource;

  @override
  Future<List<AllergiesEntity>> getAllAllergies() async {
    final dtos = await dataSource.fetchAll();
    return dtos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<int>> findAllergyIdsByNames(List<String> names) {
    return dataSource.findIdsByNames(names);
  }

  @override
  Future<List<String>> findAllergyNamesByIds(List<int> ids) {
    return dataSource.findNamesByIds(ids);
  }
}
