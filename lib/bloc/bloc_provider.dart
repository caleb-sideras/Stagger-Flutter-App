import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/bloc/fav_bloc.dart';
import 'package:stagger_v3/bloc/acc_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget{

final FavBloc? favBloc;
final CryptoAllBloc? caBloc;
final AccountBloc? accBloc;

const BlocProvider({
  Key? key,
  required Widget child,
  this.favBloc,
  this.caBloc,
  this.accBloc
}) : super(key: key, child: child);

  static BlocProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider old){
    return true;
  }

}