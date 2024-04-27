import 'package:beauty_places/data/models/place_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'write_state.dart';

class WriteCubit extends Cubit<WriteState> {
  WriteCubit() : super(WriteInitial());

  void sendModel(PlaceModel model) {
    
  }
}
