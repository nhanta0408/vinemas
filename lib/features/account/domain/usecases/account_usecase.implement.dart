import 'dart:typed_data';

import '../../data/models/account_model.dart';
import '../entities/account_entity.dart';
import '../repo/account_repository.dart';
import 'account_usecase.dart';

class AccountUsecaseImplement extends AccountUsecase {
  final AccountRepository _repository;
  AccountUsecaseImplement(this._repository);

  @override
  Future<AccountEntity?> getAccountData(String userId) async {
    final model = await _repository.getAccountData(userId);
    return model?.convertToEntity();
  }

  @override
  Future<void> setAccountData(AccountEntity account) {
    final model = AccountModel.fromEntity(account);
    return _repository.setAccountData(model);
  }

  @override
  Future<void> changedAvatar({
    required Uint8List avatarData,
    required String email,
    required AccountEntity accountData,
  }) async {
    final imageUrl =
        await _repository.changeAvatar(avatarData: avatarData, email: email);
    final newAccountData = accountData.copyWith(avatarUrl: imageUrl);
    await setAccountData(newAccountData);
  }

  @override
  Future<void> signOut() {
    return _repository.signOut();
  }
}
