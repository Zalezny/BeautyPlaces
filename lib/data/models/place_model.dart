import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {

  factory PlaceModel({
    required String title,
    required String description,
    required String imageUrl,
    @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson) required GeoPoint location,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);
}


GeoPoint _locationFromJson(dynamic json) {
  final Map<String, dynamic> map = json as Map<String, dynamic>;
  return GeoPoint(map['latitude'] as double, map['longitude'] as double);
}

_locationToJson(GeoPoint location) => <String, double>{'latitude': location.latitude, 'longitude': location.longitude};