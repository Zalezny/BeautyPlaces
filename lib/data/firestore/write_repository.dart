import 'package:beauty_places/data/models/comment_model.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WriteRepository {
  final _db = FirebaseFirestore.instance;
  final _placecollectionName = 'places';
  final _usercollectionName = 'users';

  Future<List<PlaceModel>?> places() async {
    final event = await _db.collection(_placecollectionName).get();
    List<PlaceModel> list = [];
    final users = await this.users();

    for (var doc in event.docs) {
      PlaceModel model = PlaceModel.fromJson(doc.data());
      final comments = model.comments.map((comment)=> comment.copyWith(email: users[comment.ownerId])).toList();
      model = model.copyWith(comments: comments);
      list.add(model.copyWith(uuid: doc.id));
    }

    return list;
  }

  Future<Map<String, String>> users() async {
    final event = await _db.collection(_usercollectionName).get();
    Map<String, String> list = {};
    for (var doc in event.docs) {
      list[doc.id] = doc.data()['email'];
    }
    return list;
  }

  Future<String?> sendPlace(PlaceModel model) async {
    try {
      final result = await _db.collection(_placecollectionName).add(model.toJson());
      return result.id;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future<void> addComment(String placeUuid, CommentModel comment) async {
    try {
      final placeRef =  _db.collection(_placecollectionName).doc(placeUuid);
       await placeRef.update({
        'comments': FieldValue.arrayUnion([comment.toJson()])
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> createUser(String email, String uid) async {
    try {
      await _db.collection(_usercollectionName).doc(uid).set({
        'email': email,
        'uid': uid,
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
