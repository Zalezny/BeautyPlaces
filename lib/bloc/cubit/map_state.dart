part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    List<PlaceModel>? models,
  }) = _MapState;
}
