import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/pages/algo.dart';
import 'package:stagger_v3/pages/crypto_page.dart';
import 'package:stagger_v3/pages/symbol_data.dart';
import 'home.dart';
import 'package:stagger_v3/bloc/fav_bloc.dart';
import 'package:stagger_v3/nav_bar/navigation_bar.dart';
import 'package:stagger_v3/pages/cypto_all.dart';
import 'package:stagger_v3/pages/account.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var navIndex = 0;

  final navBarList = List<IconData>.unmodifiable(
      [Icons.home_outlined, Icons.graphic_eq_rounded]); //Icons.search_outlined,Icons.person_outline

  final navBarListActive = List<IconData>.unmodifiable(
      [Icons.home, Icons.graphic_eq_rounded]); //Icons.search,Icons.person,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,//.grey.shade900,
      body: IndexedStack(
        index: navIndex,
        children: List<Widget>.unmodifiable([
          CryptoData(),
          // CryptoAll(),
          // HomePage(),
          Algorithm()
          // Account()
          // CryptoPage(),
        ]),
      ),
      bottomNavigationBar: NavBar(
        icons: navBarList,
        iconsActive: navBarListActive,
        onPressed: (i) => setState(() => navIndex = i),
        activeIndex: navIndex,
      ),
    );
  }
}
