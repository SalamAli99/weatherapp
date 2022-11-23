import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/business_logic/cubit/charachters_cubit.dart';
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/data/repository/charachters_repository.dart';
import 'package:weatherapp/data/web_services/charachters_web_services.dart';
import 'package:weatherapp/presentation/screens/charachters_screen.dart';

import 'data/models/charachters.dart';
import 'presentation/screens/charachter_details_screen.dart';

//routing file easy way
class AppRouter {
  late CharactersRepository charactersRepository;
  late CharachtersCubit charachtersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharechtersWebServices());
    charachtersCubit = CharachtersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allcharachtersRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharachtersCubit(charactersRepository),
                  child: const CharachtersScreen(),
                ));
      case charachterDetailsScreen:
        final charachter = settings.arguments as Charachter;
        return MaterialPageRoute(
            builder: (_) => CharachterDetailsScreen(
                  charachter: charachter,
                ));
    }
  }
}
