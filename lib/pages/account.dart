import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stagger_v3/bloc/acc_bloc.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';

class Account extends StatefulWidget {
  // Account({required Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final acBloc = BlocProvider.of(context)!.accBloc;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height -
        kToolbarHeight -
        kBottomNavigationBarHeight -
        kTextTabBarHeight);
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
      color: Colors.grey),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          topText(),
          accountCard(acBloc, itemWidth, itemHeight),
          SizedBox(
            height: 10,
          ),
          accountPortfolio(acBloc, itemWidth, itemHeight)
        ],
      ),
    );
  }

  Widget topText() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      alignment: Alignment.centerLeft,
      child: const Text('My Account',
          style: TextStyle(fontSize: 24, color: Colors.white)),
    );
  }

  Widget accountCard(var acBloc, double itemWidth, double itemHeight) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFF1E1E1E)),//Color(0xFFB5D3E3)),
      width: itemWidth / 1.1,
      height: itemHeight / 4.5,
      child: StreamBuilder(
        stream: acBloc.accountBalance,
        initialData: '0',
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // const Text('Spot Account', style: TextStyle(fontSize: 22),),
              Text(
                '\$${snapshot.data}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('Fees'),
              //     Icon(Icons.info_outline, size: 20),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [Text('Maker: 0.1%'), Text('Taker: 0.1%')],
              //     ),    
              //   ],
              // ),
              Container(
                // width: itemWidth / 2.2,
                height: itemHeight / 10,
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF333333)),//Color(0xFFCBE6FF)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/BinanceIcon.png',
                        fit: BoxFit.fitHeight, height: 40),
                        SizedBox(width: 10,),
                    Text(
                      'Spot Account',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(Icons.info_outline, size: 18, color: Colors.grey,)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget accountPortfolio(var acBloc, double itemWidth, double itemHeight) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color:  Color(0xFF333333)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Portfolio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              height: itemHeight / 20,
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: StreamBuilder(
                stream: acBloc.accountData,
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(), //ClampingScrollPhysics
                    children: snapshot.data
                        .map<Widget>((post) => Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Colors.transparent,
                                            BlendMode.overlay),
                                        child: Image.asset(
                                            'assets/crypto_icons/color/${post['asset'].toLowerCase()}.png',
                                            fit: BoxFit.fitHeight,
                                            height: 60),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              // color: Colors.purpleAccent,
                                              // width: 100,
                                              // height: 100,
                                              child: Text(
                                            post['asset'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold, color: Colors.white),
                                          )),
                                          Container(
                                              // color: Colors.purpleAccent,
                                              // width: 100,
                                              // height: 100,
                                              child: Text(
                                            post['free'].toString(),
                                            style: TextStyle(
                                              color: Colors.white 
                                            ),
                                          ))
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                          // color: Colors.purpleAccent,
                                          // width: 100,
                                          // height: 100,
                                          child: Text(
                                        '\$${post['price'].toString()}',
                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ]))
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
