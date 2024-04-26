import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  final db = FirebaseFirestore.instance;
  final collectionName = 'places';

  Future<void> places() async {
    await db.collection(collectionName).get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
}
