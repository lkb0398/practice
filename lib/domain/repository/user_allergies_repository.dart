abstract class UserAllergiesRepository {
  Future<void> saveUserAllergies({
    required String userId,
    required List<int> allergyIds,
  });
  Future<List<String>> getUserAllergyNames(String userId);
}
