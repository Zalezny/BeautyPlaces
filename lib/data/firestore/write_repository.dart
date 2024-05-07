import 'package:beauty_places/data/models/place_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WriteRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionName = 'places';

  Future<List<PlaceModel>?> places() async {
    final event = await _db.collection(_collectionName).get();
    List<PlaceModel> list = [];
    for (var doc in event.docs) {
      print("${doc.id} => ${doc.data()} r");
      list.add(PlaceModel.fromJson(doc.data()));
    }
    return list;
  }

  Future<String?> sendPlace(PlaceModel model) async {
    try {
      final result = await _db.collection(_collectionName).add(model.toJson());
      print(result);
      return result.id;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
