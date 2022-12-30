import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nekosama/src/features/authentication/domain/app_user.dart';

final db = FirebaseFirestore.instance;
const usersCollection = 'users';

/// appUsers コレクションの参照。
final appUsersRef = db.collection(usersCollection).withConverter(
      fromFirestore: (ds, _) => AppUser.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// appUser ドキュメントの参照。
DocumentReference<AppUser> appUserRef({
  required String userId,
}) =>
    appUsersRef.doc(userId);
