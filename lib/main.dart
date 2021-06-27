
import 'package:flutter/material.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/bloc/fav_bloc.dart';
import 'package:stagger_v3/bloc/acc_bloc.dart';
import 'package:stagger_v3/pages/pages.dart';
import 'bloc/bloc_provider.dart';

void main() {
  final favBloc = FavBloc();
  final caBloc = CryptoAllBloc(favBloc);
  final accBloc = AccountBloc();
  runApp(
     BlocProvider(
      favBloc: favBloc,
      caBloc: caBloc,
      accBloc: accBloc,
      child: MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      home: MainPage(),
    );
  }
}
