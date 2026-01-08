import 'package:vitameal/data/data_source/diseases_data_source.dart';
import 'package:vitameal/data/data_source/user_diseases_data_source.dart';
import 'package:vitameal/domain/repository/user_diseases_repository.dart';

class UserDiseasesRepositoryImpl implements UserDiseasesRepository {
  UserDiseasesRepositoryImpl(this.userDiseasesDS, this.diseasesDS);

  final UserDiseasesDataSource userDiseasesDS;
  final DiseasesDataSource diseasesDS;

  @override
  Future<void> saveUserDiseases({
    required String userId,
    required List<int> diseaseIds,
  }) async {
    await userDiseasesDS.saveUserDiseases(
      userId: userId,
      diseaseIds: diseaseIds,
    );
  }

  @override
  Future<List<String>> getUserDiseaseNames(String userId) async {
    final ids = await userDiseasesDS.getUserDiseaseIds(userId);
    return diseasesDS.findNamesByIds(ids);
  }
}
