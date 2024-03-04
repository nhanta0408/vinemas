import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/account_model.dart';
import 'account_firestore_datasource.dart';

class AccountFirestoreDataSourceImplement extends AccountFirestoreDataSource {
  @override
  Future<AccountModel?> getAccountData(String userId) async {
    final db = FirebaseFirestore.instance;
    final accountRef = db.collection('accounts');
    final query = accountRef.where('user_id', isEqualTo: userId);
    final result = await query.get();
    final data = result.docs.firstOrNull?.data();
    return data == null ? null : AccountModel.fromJson(data);
  }

  @override
  Future<void> setAccountData(AccountModel account) async {
    final db = FirebaseFirestore.instance;
    if (account.email == null) {
      throw Exception('Email is null');
    }
    final docRef = db
        .collection('accounts')
        .withConverter(
          fromFirestore: (snapshot, option) {
            final data = snapshot.data();
            if (data == null) {
              return null;
            }
            return AccountModel.fromJson(data);
          },
          toFirestore: (account, options) =>
              account?.toJson() ?? <String, Object?>{},
        )
        .doc(account.email);
    return docRef.set(account, SetOptions(merge: true));
  }
}
