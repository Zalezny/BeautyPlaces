import 'package:beauty_places/data/models/place_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/firestore/write_repository.dart';

part 'write_state.dart';

class WriteCubit extends Cubit<WriteState> {
  final WriteRepository _writeRepository;
  WriteCubit(this._writeRepository) : super(WriteInitial());

  Future<String?> sendModel(PlaceModel model) async {
    final id = await _writeRepository.sendPlace(model);
    return id;
  }
}
