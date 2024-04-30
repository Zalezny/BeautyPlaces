import 'package:beauty_places/data/models/place_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WriteRepository {
  final db = FirebaseFirestore.instance;
  final collectionName = 'places';

  Future<void> places() async {
    await db.collection(collectionName).get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()} r");
      }
    });
  }

  Future<String?> sendPlace(PlaceModel model) async {
    try {
      final result = await db.collection(collectionName).add({'test': 'test'});
      print(result);
      return result.id;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
