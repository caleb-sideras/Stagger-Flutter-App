import 'package:flutter/rendering.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/pages/account.dart';
import 'package:stagger_v3/pages/crypto_page.dart';
import 'package:stagger_v3/pages/cypto_all.dart';

class CryptoData extends StatefulWidget {
  @override
  _CryptoDataState createState() => _CryptoDataState();
}

class _CryptoDataState extends State<CryptoData> {
  List<Map<String, double>> _finalList = <Map<String, double>>[];
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context)!.caBloc;
    final acBloc = BlocProvider.of(context)!.accBloc;
    // final favBloc = BlocProvider.of(context)!.favBloc;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height -
        kToolbarHeight -
        kBottomNavigationBarHeight -
        kTextTabBarHeight);
    final double itemWidth = size.width;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [               
                IconButton(
                  icon: const Icon(Icons.person_outline_rounded, color: Colors.grey,),
                  onPressed: () {
                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Account(),
                                  )
                    );
                  },
                  // alignment: Alignment.centerLeft,
                  color: Colors.black,
                ),
                 Image.asset('assets/images/StaggerLogo6.png', height: 40),
                 IconButton(
                   icon: Icon(Icons.search, color: Colors.grey,),
                   onPressed: () {
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CryptoAll(),
                                  )
                    );
                                  
                    // handle the press
                  },),
              ],
            ),      
          ),
          backgroundColor: Color(0xFF1E1E1E), //Color(0xFFB5D3E3),
          elevation: 0,
        //   actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.person_outline_rounded, color: Colors.grey,),
        //     tooltip: 'Favorite',
        //     onPressed: () {
        //       // handle the press
        //     },
        //     // alignment: Alignment.centerLeft,
        //     color: Colors.black,
        //   ),
        // ],
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            topText(itemWidth, itemHeight),
            accountCard(acBloc, itemWidth, itemHeight),
            bottomText(itemWidth, itemHeight),
            SizedBox(height: 10,),
            // _accountData(itemWidth, itemHeight),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                // padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                width: itemWidth/1.05,
                height: selected ? itemHeight / 2 : itemHeight,
                // alignment:
                //     // selected ? Alignment.centerRight : Alignment.centerRight,
                //     Alignment.centerRight,
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                child: StreamBuilder<List<temp>>(
                  stream: bloc!.gcSC,
                  initialData: <temp>[],
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(), //ClampingScrollPhysics
                    children: snapshot.data
                        .map<Widget>(
                          (post) => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CryptoPage(cryptoData: post)),
                                  );
                                },
                                onLongPress: () {
                                  setState(() {
                                    selected = !selected;
                                  });
                                },
                                // onDoubleTap: (){
                                //   favBloc!.addFavorite.add([(post.cgm.name).toLowerCase(),(post.cgm.symbol).toUpperCase()]);
                                // },
                                child: AnimatedContainer(
                                    alignment: selected
                                        ? Alignment.center
                                        : AlignmentDirectional.topCenter,
                                    width: selected
                                        ? itemWidth / 2.2
                                        : itemWidth / 1.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            selected ? 20 : 40),
                                        color: Color(0xFF1E1E1E)),
                                    // color: selected ? Colors.red : Colors.blue,
                                    // alignment: selected
                                    //     ? Alignment.center
                                    //     : AlignmentDirectional.topCenter,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.fastOutSlowIn,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _topTabContents(
                                              itemWidth / 1.1,
                                              itemHeight,
                                              post.cgm.name,
                                              post.cgm.symbol),
                                          _bottomTabContents(
                                              itemWidth / 1.1,
                                              itemHeight,
                                              post.cgm.current_price,
                                              post.cgm.price_change_percentage_24h
                                                  .toStringAsFixed(1),
                                              post.cgm.market_cap_rank.toString(),
                                              post.color,
                                              post.cgm.market_cap,
                                              post.kline),
                                        ])),
                              ),
                              const SizedBox(width: 15)
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          
          ],
        ));
  }

   Widget topText(double itemWidth, double itemHeight) {
    return Align(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        width: itemWidth/1.1,
        height: itemHeight/10,
        alignment: Alignment.bottomLeft,
        child: const Text('Accounts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
   Widget bottomText(double itemWidth, double itemHeight) {
    return Align(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        width: itemWidth/1.1,
        height: itemHeight/10,
        alignment: Alignment.bottomLeft,
        child: const Text('WatchList',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
  Widget accountCard(var acBloc, double itemWidth, double itemHeight) {
    return Align(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFF1E1E1E)),
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
                Text(
                  '\$${snapshot.data}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Spacer(),
                Container(
                  // width: itemWidth / 2.2,
                  height: itemHeight / 10,
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF333333)),
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
      ),
    );
  }
  _percentageColor(String percentage) {
    if (percentage.contains('-'))
      return Color(0xFFE54C38);
    else
      return Color(0xFF9FCE88);
  }

  Widget _topTabContents(double itemWidth, double itemHeight, String cryptoName,
      String cryptoSymbol) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          width: selected ? itemWidth / 2.5 : itemWidth / 1.25,
          height: selected ? itemHeight / 8 : itemHeight / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(selected ? 20 : 40),
              color: Color(0xFF333333)),
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                width: selected ? itemHeight / 16 : itemHeight / 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.transparent),
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Colors.transparent, BlendMode.overlay),
                  child: Image.asset(
                    'assets/crypto_icons/color/$cryptoSymbol.png',
                    fit: BoxFit.fitWidth,
                    // height: selected ? itemHeight / 24 : itemHeight / 12
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                      width: selected ? itemWidth / 4 : itemWidth / 2,
                      height: selected ? itemHeight / 24 : itemHeight / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.transparent),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cryptoName,
                            style: TextStyle(color: Colors.white),
                          ))),
                  AnimatedContainer(
                      height: selected ? itemHeight / 48 : itemHeight / 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.transparent),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            cryptoSymbol.toUpperCase(),
                            style: TextStyle(color: Colors.grey),
                          ))),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          width: selected ? itemWidth / 40 : itemWidth / 20,
          height: selected ? itemHeight / 8 : itemHeight / 4,
          color: Colors.transparent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
        ),
      ],
    );
  }

  Widget _bottomTabContents(
      double itemWidth,
      double itemHeight,
      double cryptoPrice,
      String cryptoPercent,
      String marketCapRank,
      var color,
      int marketCap,
      var kline) {
    var g = NumberFormat.compact();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bottomTabRank(itemWidth, itemHeight, marketCapRank, color, marketCap),
        _bottomTabGraph(
            itemWidth, itemHeight, cryptoPrice, cryptoPercent, kline)
      ],
    );
  }

  Widget _bottomTabRank(double itemWidth, double itemHeight,
      String marketCapRank, var color, int marketCap) {
    var g = NumberFormat.compact();
    return AnimatedContainer(
      width: selected ? itemWidth / 8 : itemWidth / 4,
      height: selected ? itemHeight / 8 : itemHeight / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(selected ? 15 : 30),
          color: color.color),
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
              height: selected ? itemHeight / 12 : itemHeight / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.transparent),
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    marketCapRank,
                    style: TextStyle(color: color.titleTextColor),
                  ))),
          AnimatedContainer(
              height: selected ? itemHeight / 30 : itemHeight / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.transparent),
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    g.format(marketCap),
                    style: TextStyle(color: color.bodyTextColor),
                  ))),
        ],
      ),
    );
  }

  Widget _bottomTabGraph(double itemWidth, double itemHeight,
      double cryptoPrice, String cryptoPercent, var kline) {
    var f = NumberFormat.currency(locale: 'en_US', name: '\$');
    var d = NumberFormat.percentPattern();
    final graphTabWidth = itemWidth / 1.75;
    final graphTabHeight = itemHeight / 1.75;
    return AnimatedContainer(
      width: selected ? graphTabWidth / 2 : graphTabWidth,
      height: selected ? graphTabHeight / 2 : graphTabHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(selected ? 20 : 40),
          color: Color(0xFF333333)),
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        AnimatedContainer(
            height: selected ? graphTabHeight / 20 : graphTabHeight / 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.transparent),
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  f.format(cryptoPrice),
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                ))),
        AnimatedContainer(
          height: selected ? graphTabHeight / 3 : graphTabHeight / 1.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.transparent),
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          child: OHLCVGraph(
            data: kline,
            enableGridLines: false,
            volumeProp: 0,
            increaseColor: Color(0xFF9FCE88),
            decreaseColor: Color(0xFFE54C38),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
                height: selected ? graphTabHeight / 30 : graphTabHeight / 15,
                // width: selected ? graphTabWidth / 20 : graphTabWidth / 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: _percentageColor(cryptoPercent)),
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                child: FittedBox(
                    fit: BoxFit.fitHeight, child: Text('$cryptoPercent%', style: TextStyle(color: Colors.black),))),
          ],
        )
      ]),
    );
  }

  Widget _accountData(double itemWidth, double itemHeight) {
    return Container(
      width: itemWidth / 1.1,
      height: itemHeight / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(selected ? 20 : 40),
          color: Color(0xFFB5D3E3)),
      child: null,
    );
  }
}
