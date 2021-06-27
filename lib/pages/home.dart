import 'dart:math';
import 'package:intl/intl.dart';
import 'dart:convert' as json;

import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:stagger_v3/src/cg_markets.dart';
import 'package:palette_generator/palette_generator.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_candlesticks/flutter_candlesticks.dart';
// import 'package:stagger_v3/paint/candlestick_data.dart';
import 'package:stagger_v3/src/kline_parsing.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

class HomePage extends StatefulWidget {
  // final CryptoAllBloc bloc;
  // const HomePage({Key? key, required this.bloc}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, double>> _finalList = <Map<String, double>>[];
  bool _loadingFavoriteCrypto = false;
  var value;
  List<String> _favoriteList = [
    'BTCUSDT',
    'ETHUSDT',
    'LINKUSDT',
    'ADAUSDT',
    'ALGOUSDT'
  ];
  List<String> _favoriteList2 = ['BTC', 'ETH', 'LINK', 'ADA', 'ALGO'];
@override
void initState(){
  binanceData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Colors.grey.shade900,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //Colors.grey.shade600, //change your color here
        ),
        backgroundColor: Colors.black, //Colors.grey.shade900,
        title: Text(
          'Dark theme',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        // centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              null;
            },
          )
        ],
      ),
      body: _buildSavedBody(),
    );
  }

  Widget _buildSavedBody() {
    final acBloc = BlocProvider.of(context)!.accBloc;
        var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height -
        kToolbarHeight -
        kBottomNavigationBarHeight -
        kTextTabBarHeight);
    final double itemWidth = size.width;
    return Container(
      color: Colors.transparent, //Color(0xAAF2FFD2),
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Column(
        children: <Widget>[
          // _accountData(),
          accountCard(acBloc, itemWidth, itemHeight),
          // _getListViewSavedWidget(),
          // _cryptoTab2(),
        ],
      ),
    );
  }

 Widget accountCard(var acBloc, double itemWidth, double itemHeight) {
     return Align(
       alignment: Alignment.center,
       child: Container(
          width: itemWidth / 1.1,
              height: itemHeight / 8,
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFB5D3E3)),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
                  width: itemWidth / 2.5,
                  height: itemHeight / 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFCBE6FF)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: itemHeight / 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.transparent),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Colors.transparent, BlendMode.overlay),
                          child: Image.asset(
                            'assets/crypto_icons/color/btc.png',
                            fit: BoxFit.fitWidth,
                            // height: selected ? itemHeight / 24 : itemHeight / 12
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              width: itemWidth / 4,
                              height: itemHeight / 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.transparent),
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Bitcoin',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                          Container(
                              height: itemHeight / 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.transparent),
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    'BTC',
                                    style: TextStyle(color: Colors.grey),
                                  ))),
                         
                        ],
                      ),
                    ],
                  ),
                ),
                 Container(
                   width: itemWidth/2.5,
                  //  color: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: itemWidth/5,
                                child: FittedBox(
                                   fit: BoxFit.fitWidth,
                                  child: Text(
                                    '\$40,913',
                                  ),
                                ),
                              ),
                               Container(
                                width: itemWidth/12.5,
                                child: FittedBox(
                                   fit: BoxFit.fitWidth,
                                  child: Text(
                                    '\1.9%',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   child: Icon(Icons.favorite_border, color: Colors.grey,),
                        // )
           ],
         ),
       ),
     );
  }
  Widget _accountData() {
    return Container(
      // margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () => (null),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.lightBlue,
              child: _accountBalance(),
            ),
          ),
          // GestureDetector(
          //   onTap: () => (null),
          //   child: Card(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     color: Colors.lightBlue,
          //     child: _accountBalance(),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _accountBalance() {
    return Container(
      // alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.95,
      // margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
      // width: MediaQuery.of(context).size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.account_box_sharp,
                color: Colors.black,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Portfolio',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              Text(
                '\$957.50',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _cryptoTab() {
  //   var size = MediaQuery.of(context).size;
  //   final double itemHeight = (size.height - kToolbarHeight - 24);
  //   final double itemWidth = size.width;
  //   return Flexible(
  //       child: StreamBuilder<List<temp>>(
  //           stream: bloc.gcSC,
  //           initialData: <temp>[],
  //           builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
  //                 children: snapshot.data
  //                     .map<Widget>((post) => Container(
  //                           // color: Colors.pink,
  //                           height: itemHeight / 6,
  //                           child: Card(
  //                             elevation: 0,
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(30),
  //                             ),
  //                             color: const Color(0xFFe5e4cc), //Colors.orange,
  //                             child: _cryptoTabTitle(
  //                                 itemHeight / 6,
  //                                 itemWidth,
  //                                 post.cgm.name,
  //                                 post.cgm.symbol,
  //                                 post.cgm.price_change_percentage_24h
  //                                     .toStringAsFixed(2)),
  //                           ),
  //                         ))
  //                     .toList(),
  //               )));
  // }

  // Widget _cryptoTabTitle(double parentHeight, double parentWidth,
  //     String cryptoName, String cryptoSymbol, String cryptoPercent) {
  //   final double _topContainerWidth = parentWidth * 0.85;
  //   final double _topContainerHeight = parentHeight / 2.5;
  //   return Align(
  //     alignment: Alignment.topCenter,
  //     child: Stack(
  //       // padding: EdgeInsets.fromLTRB(0, parentHeight/12, 0, 0),
  //       // color: Colors.blue,
  //       // width: _topContainerWidth,
  //       // height: _topContainerHeight,
  //       // clipBehavior: Clip.none,
  //       // decoration: null,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.fromLTRB(0, parentHeight / 12, 0, 0),
  //           // color: Colors.blue,
  //           width: _topContainerWidth,
  //           height: _topContainerHeight,
  //           child: Card(
  //               // semanticContainer: true,
  //               clipBehavior: Clip.hardEdge,
  //               elevation: 0,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(50),
  //               ),
  //               color: Color(0xFF698474),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.baseline,
  //                 textBaseline: TextBaseline.alphabetic,
  //                 children: <Widget>[
  //                   SizedBox(width: _topContainerWidth / 5),
  //                   Text(cryptoName,
  //                       style: const TextStyle(
  //                           fontWeight: FontWeight.w400, fontSize: 16)),
  //                   SizedBox(width: _topContainerWidth / 40),
  //                   Text(cryptoSymbol.toUpperCase(),
  //                       style: const TextStyle(
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 12,
  //                           color: Colors.grey))
  //                 ],
  //               )),
  //         ),
  //         ColorFiltered(
  //           colorFilter:
  //               const ColorFilter.mode(Colors.transparent, BlendMode.overlay),
  //           child: Image.asset('assets/crypto_icons/black/$cryptoSymbol.png',
  //               fit: BoxFit.fitHeight, height: parentHeight / 2),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _cryptoTab2() {
    final bloc = BlocProvider.of(context)!.caBloc;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24);
    final double itemWidth = size.width;
    return Flexible(
        child: StreamBuilder<List<temp>>(
            stream: bloc!.gcSC,
            initialData: <temp>[],
            builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
                  children: snapshot.data
                      .map<Widget>((post) => Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          // color: Colors.pink,
                          height: itemHeight / 5,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: const Color(0xFF31312F),//Color(0X5534302F) //Color(0xFFFFF8DC)
                            child: _cryptoTabContents(
                                itemHeight / 5,
                                itemWidth,
                                post.cgm.name,
                                post.cgm.symbol,
                                post.cgm.price_change_percentage_24h
                                    .toStringAsFixed(2),
                                post.cgm.current_price,
                                post.cgm.high_24h,
                                post.cgm.low_24h,
                                post.cgm.market_cap,
                                post.cgm.market_cap_rank),
                          )))
                      .toList(),
                )));
  }

  Widget _cryptoTabContents(
      double parentHeight,
      double parentWidth,
      String cryptoName,
      String cryptoSymbol,
      String cryptoPercent,
      double cryptoPrice,
      double cryptoHigh,
      double cryptoLow,
      int marketCap,
      int  marketCapRank) {
    var f = NumberFormat.currency(locale: 'en_US', name: '\$');
    var d = NumberFormat.percentPattern();
    var g = NumberFormat.compact();
    final double _topContainerWidth = parentWidth * 0.85;
    final double _topContainerHeight = parentHeight;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          // color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Colors.transparent, BlendMode.overlay),
                  child: Image.asset(
                    'assets/crypto_icons/white/$cryptoSymbol.png',
                    fit: BoxFit.fitHeight,
                    height: parentHeight / 3,
                  ),
                ),
                Container(
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Text(
                    cryptoName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .white), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),
                  Text(
                    cryptoSymbol.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .grey,), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),],
                  ),
                ),
               
                  ]
                ),
                Row(children: [
                  Text(
                    'High:${cryptoHigh.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .grey,), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),
                  Text(
                    'Low:${cryptoLow.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .grey,), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),],),
                  Row(children: [
                  Text(
                    'Rank:${marketCapRank.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .grey,), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),
                  Text(
                    'Cap:${g.format(marketCap)}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .grey,), //Color(0xFF9FCE88)),//Color(0xEE585435), //Colors.grey.shade700),
                  ),],)
                
              ]),
        ),
        SizedBox(
          width: parentWidth / 15,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                Text(
                  f.format(cryptoPrice),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, //Color(0xFFFFF8DC),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                    // width: _topContainerWidth/2,
                    // height: _topContainerHeight/4,
                    child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: _percentageColor(
                            cryptoPercent), //Color(0xEE788355),
                        child: Center(
                          child: Text(
                            '${double.parse(cryptoPercent).toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF31312F), //Color(0xFFFFF8DC),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ]),
              Container(
                height: _topContainerHeight / 1.7,
                width: _topContainerWidth / 2,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: _topContainerHeight / 1.7,
                width: _topContainerWidth / 2,
      child: 
      OHLCVGraph(
        data: _finalList,//Map[{"open" : 40.0, "high" : 75.0, "low" : 25.0, "close" : 50.0, "volumeto" : 5000.0}];
        enableGridLines: false,
        volumeProp: 0.2,
        gridLineAmount: 4,
        gridLineColor: Colors.grey.shade800,
        labelPrefix: '',
        gridLineLabelColor: Colors.grey.shade600,
        )
    ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  binanceData() async{
       var now = DateTime.now();
    var temp1 = DateTime(now.year, now.month, now.day-1, now.hour).millisecondsSinceEpoch.toString();
    var temp2 = now.millisecondsSinceEpoch.toString();

    final url = Uri.parse('https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=4h&startTime=$temp1&endTime=$temp2');
    final response = await http.get(url);
     final parsed = json.jsonDecode(response.body);
     final temp3 = <Map<String, double>>[];
    //  print(parsed);
    for (var item in parsed) {

      temp3.add({
     "open": double.parse(item[1]),
    "high": double.parse(item[2]),
    "low": double.parse(item[3]),
    "close": double.parse(item[4]),
    "volumeto": double.parse(item[5]),
  });
    }

    _finalList = temp3;
  }

  // Widget _getListViewSavedWidget() {
  //   var size = MediaQuery.of(context).size;
  //   final double itemHeight = (size.height - kToolbarHeight - 24);
  //   final double itemWidth = size.width;
  //   Color? background;
  //   return Flexible(
  //       child: StreamBuilder<List<temp>>(
  //     stream: widget.bloc.gcSC,
  //     initialData: <temp>[],
  //     builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
  //       children: snapshot.data
  //           .map<Widget>(
  //             (post) =>
  //                 // Container(
  //                 // onTap: () => null,
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //       builder: (context) => CryptoData(currency: currency)),
  //                 // );,
  //                 // child:
  //                 Card(
  //                     // margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
  //                     elevation: 0,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                     // ignore: todo
  //                     color: Color(
  //                         0xDD494949), //Color(0xAAEEECF1),//Color(0xAACFCFC4),//post.color.color,//0x207207196', radix: 16)),
  //                     child: Container(
  //                       // color: Colors.red,
  //                       margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //                       height: itemHeight / 6,
  //                       child: GridView.count(
  //                         childAspectRatio:
  //                             (itemWidth / (itemHeight / 3)), //1.3
  //                         primary: false,
  //                         physics: NeverScrollableScrollPhysics(),
  //                         crossAxisCount: 3,
  //                         shrinkWrap: true,
  //                         children: <Widget>[
  //                           Container(
  //                               // color: Colors.lightBlue,
  //                               alignment: Alignment.center,
  //                               child: Image.asset(
  //                                   'assets/crypto_icons/white/${post.cgm.symbol}.png',
  //                                   fit: BoxFit.fitHeight,
  //                                   height: itemHeight / 15)),
  //                           Container(
  //                             // color: Colors.red,
  //                             padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   post.cgm.name,
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.w400,
  //                                       color: post.color.titleTextColor,
  //                                       fontSize: 20),
  //                                 ),
  //                                 Text(
  //                                   (post.cgm.symbol).toUpperCase(),
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.w400,
  //                                       color: post.color.titleTextColor,
  //                                       fontSize: 14),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                             padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.end,
  //                               children: [
  //                                 Text(
  //                                     '\$${post.cgm.current_price.toStringAsFixed(2)}',
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 18,
  //                                         fontWeight: FontWeight.w400)),
  //                                 Card(
  //                                   elevation: 0,
  //                                   color: _percentageColor(post
  //                                       .cgm.price_change_percentage_24h
  //                                       .toString()),
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(30),
  //                                   ),
  //                                   child: Text(
  //                                     '${post.cgm.price_change_percentage_24h.toStringAsFixed(2)}%',
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 14,
  //                                         fontWeight: FontWeight.w400),
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                               // color:Colors.pink,
  //                               alignment: Alignment.center,
  //                               child: Column(
  //                                 children: [
  //                                   Text(
  //                                     'High: ${(post.cgm.high_24h).toString()}',
  //                                     style: TextStyle(
  //                                         fontSize: 16, color: Colors.black),
  //                                   ),
  //                                   Text(
  //                                     'Low: ${(post.cgm.low_24h).toString()}',
  //                                     style: TextStyle(
  //                                         fontSize: 16, color: Colors.black),
  //                                   ),
  //                                 ],
  //                               )),
  //                           Container(
  //                               // color: Colors.white,
  //                               alignment: Alignment.topCenter,
  //                               child: Image.asset(
  //                                   'assets/images/tempimage2.png',
  //                                   fit: BoxFit.fitHeight,
  //                                   height: itemHeight / 20)),
  //                           Container(
  //                               // color: Colors.purple,
  //                               alignment: Alignment.center,
  //                               child: Column(
  //                                 children: [
  //                                   Text(
  //                                     'CAP: ${getSuffix(post.cgm.market_cap)}',
  //                                     style: TextStyle(
  //                                         fontSize: 16, color: Colors.black),
  //                                   ),
  //                                   Text(
  //                                     'VOL: ${getSuffix(post.cgm.total_volume)}',
  //                                     style: TextStyle(
  //                                         fontSize: 16, color: Colors.black),
  //                                   ),
  //                                 ],
  //                               ))
  //                         ],
  //                       ),
  //                     )),
  //           )
  //           .toList(),
  //     ),
  //   ));
  // }

  // Container _getSubtitleSavedWidget(String high, String low) {
  //   return Container(
  //     height: 30,
  //     //color: Colors.pink,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           'High: \$$high',
  //           style: TextStyle(color: Colors.white, fontSize: 16),
  //         ),
  //         Text(
  //           'Low: \$$low',
  //           style: TextStyle(color: Colors.white, fontSize: 16),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _percentageColor(String percentage) {
    if (percentage.contains('-'))
      return Color(0xFFE54C38);
    else
      return Color(0xFF9FCE88);
  }

  String getSuffix(int num) {
    int i = (log(num) / log(1000)).truncate();
    return (num / pow(1000, i)).truncate().toString() + [' ', 'K', 'M', 'B'][i];
  }
}
