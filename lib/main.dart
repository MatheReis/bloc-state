import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/pages/bloc/home_state.dart';
import 'package:login_bloc/pages/bloc/home_event.dart';
import 'package:login_bloc/pages/home_page.dart';
import 'package:login_bloc/pages/bloc/home_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) =>
            HomeBloc(HomeloadingState())..add(HomeFetchListWithError()),
        child: HomePage(),
      ),
    );
  }
}
