part of 'charachters_cubit.dart';

@immutable
abstract class CharachtersState {}

class CharachtersInitial extends CharachtersState {}

class CharachtersLoaded extends CharachtersState {
  final List<Charachter> charachter;

  CharachtersLoaded(this.charachter);
}
