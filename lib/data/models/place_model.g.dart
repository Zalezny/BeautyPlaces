// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      location: _locationFromJson(json['location']),
      category: $enumDecode(_$CategoryEnumEnumMap, json['category']),
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': _locationToJson(instance.location),
      'category': _$CategoryEnumEnumMap[instance.category]!,
      'isFavorite': instance.isFavorite,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.places: 'Places',
  CategoryEnum.picks: 'Picks',
  CategoryEnum.riversAndCanals: 'Rivers And Canals',
  CategoryEnum.lake: 'Lake',
  CategoryEnum.nationalParks: 'National Parks',
  CategoryEnum.cities: 'Cities',
};
