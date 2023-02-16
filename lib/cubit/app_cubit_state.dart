import 'package:equatable/equatable.dart';
import 'package:travalingapp/model/data_model.dart';

abstract class cubitstate extends Equatable {}

class InitialState extends cubitstate {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends cubitstate {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends cubitstate {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends cubitstate {
  LoadedState(this.places);
  final List <DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends cubitstate {
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props => [place];
}
