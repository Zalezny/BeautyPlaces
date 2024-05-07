import 'package:beauty_places/data/firestore/write_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/place_model.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  final WriteRepository _writeRepository;
  MapCubit(this._writeRepository) : super(const MapState());

  void getModels() async {
    final places = await _writeRepository.places();
    emit(state.copyWith(models: places));
  }
}
