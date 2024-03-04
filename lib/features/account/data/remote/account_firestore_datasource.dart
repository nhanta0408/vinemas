import '../models/account_model.dart';

abstract class AccountFirestoreDataSource {
  Future<AccountModel?> getAccountData(String userId);
  Future<void> setAccountData(AccountModel account);
}
