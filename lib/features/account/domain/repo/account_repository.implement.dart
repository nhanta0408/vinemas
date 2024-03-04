// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import '../../data/models/account_model.dart';
import '../../data/remote/account_firebase_storage_datasource.dart';
import '../../data/remote/account_firestore_datasource.dart';
import 'account_repository.dart';

class AccountRepositoryImplement extends AccountRepository {
  final AccountFirestoreDataSource firestoreDataSource;
  final AccountFirebaseStorageDataSource firebaseStorageDataSource;

  AccountRepositoryImplement({
    required this.firestoreDataSource,
    required this.firebaseStorageDataSource,
  });
  @override
  Future<AccountModel?> getAccountData(String userId) {
    return firestoreDataSource.getAccountData(userId);
  }

  @override
  Future<void> setAccountData(AccountModel account) {
    return firestoreDataSource.setAccountData(account);
  }

  @override
  Future<String?> changeAvatar({
    required Uint8List avatarData,
    required String email,
  }) {
    return firebaseStorageDataSource.changeAvatar(
      avatarData: avatarData,
      email: email,
    );
  }
}
