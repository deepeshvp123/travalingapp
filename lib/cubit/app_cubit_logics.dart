import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travalingapp/cubit/app_cubit_state.dart';
import 'package:travalingapp/cubit/app_cubits.dart';
import 'package:travalingapp/pages/detail_page.dart';
import 'package:travalingapp/pages/navpages/home_page.dart';
import 'package:travalingapp/pages/navpages/main_page.dart';
import 'package:travalingapp/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, cubitstate>(
        builder: (context, state) {
          if (state is DetailState) {
            return DetailPage();
          }if (state is WelcomeState) {
            return welcomepage();
          }if (state is LoadedState) {
            return MainPage();
          }if (state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
