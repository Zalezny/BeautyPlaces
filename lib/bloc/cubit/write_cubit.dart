import 'package:beauty_places/data/models/place_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firestore/write_repository.dart';

part 'write_state.dart';

class WriteCubit extends Cubit<WriteState> {
  final WriteRepository _writeRepository;
  WriteCubit(this._writeRepository) : super(WriteInitial());

  void sendModel(PlaceModel model) {
    _writeRepository.sendPlace(model);
  }
}
