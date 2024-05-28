import 'package:beauty_places/data/firestore/write_repository.dart';
import 'package:beauty_places/utils/shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/place_model.dart';
import '../../services/injection.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  final WriteRepository _writeRepository;
  MapCubit(this._writeRepository) : super(const MapState(favorite: []));

  void getModels() async {
    final favorite = await getIt<SharedPreference>().favorites();
    final places = await _writeRepository.places();
    emit(state.copyWith(models: places, favorite: favorite));
  }

  void changeFavorite(String uuid) async {
    final List<String> list = List.from(state.favorite);
    if (list.contains(uuid)) {
      list.remove(uuid);
    } else {
      list.add(uuid);
    }
    await getIt<SharedPreference>().setFavorites(list);
    emit(state.copyWith(favorite: list));
  }

  bool containsFavorite(String uuid) {
    return state.favorite.contains(uuid);
  }

  void writePlace(PlaceModel place, Function(String) onSuccess) async {
    final id = await _writeRepository.sendPlace(place);
    if (id != null) {
      onSuccess(id);
      final models = state.models;
      place = place.copyWith(uuid: id);
      emit(state.copyWith(models: models != null ? [...models, place] : [place]));
    }
  }
}
