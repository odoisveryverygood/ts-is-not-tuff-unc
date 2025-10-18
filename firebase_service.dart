
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance;

  Future<void> testWrite() async {
    await _db.collection('test').doc('status').set({'connected': true});
  }

  Future<Map<String, dynamic>?> testRead() async {
    final doc = await _db.collection('test').doc('status').get();
    return doc.data();
  }
}
