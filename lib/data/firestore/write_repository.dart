import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/utils/logger.dart';
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
      final model = PlaceModel.fromJson(doc.data());
      list.add(model.copyWith(uuid: doc.id));
    }
    return list;
  }

  Future<String?> sendPlace(PlaceModel model) async {
    try {
      final result = await _db.collection(_collectionName).add(model.toJson());
      return result.id;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}
