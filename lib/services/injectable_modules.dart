import 'package:beauty_places/bloc/cubit/write_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  WriteCubit get writeCubit => WriteCubit();

}