import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travalingapp/cubit/app_cubit_state.dart';
import 'package:travalingapp/model/data_model.dart';
import 'package:travalingapp/pages/detail_page.dart';
import 'package:travalingapp/services/data_services.dart';

class AppCubits extends Cubit<cubitstate> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  DetailPage(DataModel data) {
    emit(DetailState(data));
  }

  gohome() {
    emit(LoadedState(places));
  }
}
