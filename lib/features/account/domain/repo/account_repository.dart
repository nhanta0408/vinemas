import 'package:flutter/foundation.dart';

import '../../data/models/account_model.dart';

abstract class AccountRepository {
  Future<AccountModel?> getAccountData(String userId);
  Future<void> setAccountData(AccountModel account);
  Future<String?> changeAvatar({
    required Uint8List avatarData,
    required String email,
  });
  Future<void> signOut();
}
