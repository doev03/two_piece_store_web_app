import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

import '../../utils/extensions.dart';

// ignore: one_member_abstracts
abstract class FirebaseStorageDataSource {
  Future<Iterable<String>> getDownloadUrls(List<String> paths);
}

class FirebaseStorageDataSourceImpl implements FirebaseStorageDataSource {
  FirebaseStorageDataSourceImpl({
    required FirebaseStorage instance,
  }) : _instance = instance;

  final FirebaseStorage _instance;

  @override
  Future<Iterable<String>> getDownloadUrls(List<String> paths) async {
    final ref = _instance.ref();

    return Future.wait(
      paths.map((path) {
        try {
          return ref.child(path).getDownloadURL();
        } on FirebaseException catch (e, s) {
          log('Firebase Exception, $e, $s');
          return null;
        }
      }).whereNotNull(),
    );
  }
}
