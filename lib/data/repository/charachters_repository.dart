import 'package:weatherapp/data/models/charachters.dart';
import 'package:weatherapp/data/web_services/charachters_web_services.dart';

class CharactersRepository {
  final CharechtersWebServices charechtersWebServices;

  CharactersRepository(this.charechtersWebServices);

  Future<List<Charachter>> getAllCharacters() async {
    final characters = await charechtersWebServices.getAllCharacters();
    return characters
        .map((charachter) => Charachter.fromJson(charachter))
        .toList();
  }
}
