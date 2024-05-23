part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    required List<String> favorite,
    List<PlaceModel>? models,
  }) = _MapState;
}
