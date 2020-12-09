import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterblog/services/api_path.dart';
import 'package:flutterblog/services/app_user.dart';

abstract class Database {
  Future<void> createUser(AppUser user);
}

class FirestoreDatabase implements Database {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(AppUser user) async => await _setData(
        documentPath: APIPath.user(user.uid),
        data: user.toMap(),
      );

  Future<void> _setData(
      {String documentPath, Map<String, dynamic> data}) async {
    final reference = _firestore.doc(documentPath);
    print('$documentPath : $data');
    await reference.set(data);
  }
}
