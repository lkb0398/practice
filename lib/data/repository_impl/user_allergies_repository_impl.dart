import 'package:vitameal/data/data_source/allergies_data_source.dart';
import 'package:vitameal/data/data_source/user_allergies_data_source.dart';
import 'package:vitameal/domain/repository/user_allergies_repository.dart';

class UserAllergiesRepositoryImpl implements UserAllergiesRepository {
  UserAllergiesRepositoryImpl(this.userAllergiesDS, this.allergiesDS);

  final UserAllergiesDataSource userAllergiesDS;
  final AllergiesDataSource allergiesDS;

  @override
  Future<void> saveUserAllergies({
    required String userId,
    required List<int> allergyIds,
  }) async {
    await userAllergiesDS.saveUserAllergies(
      userId: userId,
      allergyIds: allergyIds,
    );
  }

  @override
  Future<List<String>> getUserAllergyNames(String userId) async {
    final ids = await userAllergiesDS.getUserAllergyIds(userId);
    return allergiesDS.findNamesByIds(ids);
  }
}
