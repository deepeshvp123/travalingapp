import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travalingapp/cubit/app_cubit_logics.dart';
import 'package:travalingapp/cubit/app_cubits.dart';

import 'package:travalingapp/pages/detail_page.dart';
import 'package:travalingapp/pages/navpages/main_page.dart';
import 'package:travalingapp/pages/welcome_page.dart';
import 'package:travalingapp/services/data_services.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: BlocProvider<AppCubits>(create: (context) => AppCubits(
      data: DataServices(),
    ),
    child: AppCubitLogics(),),
  ));
}

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return welcomepage();
   // return MainPage();
    return MaterialApp();
  }
}
