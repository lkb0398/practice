abstract class UserDiseasesRepository {
  Future<void> saveUserDiseases({
    required String userId,
    required List<int> diseaseIds,
  });
  Future<List<String>> getUserDiseaseNames(String userId);
}
