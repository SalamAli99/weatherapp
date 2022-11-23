import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/data/models/charachters.dart';
import 'package:weatherapp/data/repository/charachters_repository.dart';

part 'charachters_state.dart';

class CharachtersCubit extends Cubit<CharachtersState> {
  final CharactersRepository charactersRepository;
  List<Charachter> charachters = [];
  CharachtersCubit(this.charactersRepository) : super(CharachtersInitial());

  List<Charachter> getAllCharachter() {
    charactersRepository.getAllCharacters().then((charachters) {
      //start state
      emit(CharachtersLoaded(charachters));
      this.charachters = charachters;
    });
    return charachters;
  }
}
