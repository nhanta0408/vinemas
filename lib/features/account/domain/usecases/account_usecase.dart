import 'package:flutter/foundation.dart';

import '../../../seat_selection/domain/entities/ticket_entity.dart';
import '../entities/account_entity.dart';

abstract class AccountUsecase {
  Future<AccountEntity?> getAccountData(String userId);
  Future<void> setAccountData(AccountEntity account);
  Future<void> changedAvatar({
    required Uint8List avatarData,
    required String email,
    required AccountEntity accountData,
  });
  Future<void> signOut();
}
