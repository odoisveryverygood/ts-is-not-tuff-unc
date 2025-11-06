import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get db => FirebaseFirestore.instance;

  static Future<UserCredential> signInAnon() async {
    return await auth.signInAnonymously();
  }

  static Future<void> saveBasicProfile(User user) async {
    final ref = db.collection('users').doc(user.uid);
    await ref.set({
      'uid': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
      'isAnonymous': user.isAnonymous,
    }, SetOptions(merge: true));
  }
}
