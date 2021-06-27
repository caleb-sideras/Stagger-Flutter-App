import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/pages/crypto_page.dart';
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:stagger_v3/src/cg_markets.dart';

class CryptoAll extends StatefulWidget {
  // final CryptoAllBloc bloc;
  // const CryptoAll({Key? key, required this.bloc}) : super(key: key);

  @override
  _CryptoAllState createState() => _CryptoAllState();
}

class _CryptoAllState extends State<CryptoAll> {
  bool _loadingAllCrypto = true;

  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.deepPurple,
    Colors.red,
    Colors.green,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of(context)!.caBloc;
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: Colors.grey.shade600,
      //   ),
      //   backgroundColor: Color(0xFF1E1E1E), //Colors.grey.shade900,
      //   title: Text(
      //     'Search Crypto',
      //     style: TextStyle(color: Colors.black, fontSize: 20),
      //   ),
      //   elevation: 0.0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.settings),
      //       onPressed: () {
      //         null;
      //       },
      //     )
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
  // title: Text("App Bar without Back Button"),
  automaticallyImplyLeading: false,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[ _searchBar(), _cancelButton()]),
),
      backgroundColor: Colors.black, //.grey.shade900,
      body: _buildBody(),
    );
  }

  // _loadingScreen() {
  //   if (_loadingAllCrypto) {
  //     return new Center(
  //       child: new CircularProgressIndicator(),
  //     );
  //   } else {
  //     return RefreshIndicator(
  //       onRefresh: () async {
  //         ticker24().then((posts) {
  //           setState(() {
  //             _crypto = posts;
  //           });
  //         });
  //       },
  //       child: AnimatedCrossFade(
  //         duration: Duration(milliseconds: 2000),
  //         firstChild: Center(
  //           child: CircularProgressIndicator(),
  //         ),
  //         secondChild: _buildBody(),
  //         crossFadeState: _crypto.isNotEmpty
  //             ? CrossFadeState.showSecond
  //             : CrossFadeState.showFirst,
  //       ),
  //     );
  //   }
  // }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Column(
        children: <Widget>[
          // _searchBar(),
          // SizedBox(height: 10),
          _getListViewWidget(),
        ],
      ),
    );
  }


  Widget _cancelButton(){
    return Align(child: IconButton(onPressed: () {
                    Navigator.pop(context);
                                  
                    // handle the press
                  }, icon: Icon(Icons.cancel), color: Colors.grey,));
  }
  Widget _searchBar() {
    return Align(
      child: Container(
        width: MediaQuery.of(context).copyWith().size.width * 0.8,
        height: MediaQuery.of(context).copyWith().size.height / 18,
        child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            fillColor: Color(0xFF1E1E1E),//Color(0xFFCBE6FF),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(50)),
              borderSide: BorderSide.none,
            ),
            labelText: 'Search all coins',
            prefixIcon: Icon(Icons.search, color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          showCursor: false,
        ),
      ),
    );
  }

  Widget _getListViewWidget() {
    final bloc = BlocProvider.of(context)!.caBloc;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24);

    /// 7;
    final double itemWidth = size.width;

    /// 2;
    var f = NumberFormat.currency(locale: 'en_US', name: '\$');
    var d = NumberFormat.percentPattern();
    return Flexible(
        child: StreamBuilder<BuiltList<CoinGeckoMarkets>>(
            stream: bloc!.allTickers,
            initialData: BuiltList<CoinGeckoMarkets>([]),
            builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
                  children: snapshot.data
                      .map<Widget>((post) => Column(
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
                                child: Container(
                                  width: itemWidth / 1.1,
                                  height: itemHeight / 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xFF1E1E1E)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: itemWidth / 2.5,
                                        height: itemHeight / 10,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xFF333333)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: itemHeight / 16,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  color: Colors.transparent),
                                              child: Image.network(
                                                post.image,
                                                fit: BoxFit.fitWidth,
                                                // height: selected ? itemHeight / 24 : itemHeight / 12
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: itemWidth / 4,
                                                    height: itemHeight / 24,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: FittedBox(
                                                        fit: BoxFit.fitHeight,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          post.name,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                                Container(
                                                    height: itemHeight / 48,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        color:
                                                            Colors.transparent),
                                                    child: FittedBox(
                                                        fit: BoxFit.fitHeight,
                                                        child: Text(
                                                          post.symbol
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: itemWidth / 2.5,
                                        // color: Colors.grey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              //  color: Colors.orange,
                                              height: itemHeight / 20,
                                              child: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Text(
                                                  f.format(post.current_price), style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: itemHeight / 40,
                                              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: _percentageColor(post.price_change_percentage_24h.toStringAsFixed(1))),
                                              child: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Text(
                                                  '${post.price_change_percentage_24h.toStringAsFixed(1)}%',
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
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ))
                      .toList(),
                )));
  }

  CircleAvatar _getLeadingWidget(
      var post, String currencyName, MaterialColor color) {
    // print('${post.runtimeType}, $post');
    return CircleAvatar(
      backgroundColor: color,
      child: Text(currencyName[0]),
    );
  }

  Container _getTitleSavedWidget(
      String currencyName, String percentage, String price) {
    double priceNum = double.parse(price);
    //, String icons) {
    return Container(
      // height: gridHeight ,
      // color: Colors.redAccent,
      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getLeadingSavedWidget(currencyName),
          // _cryptoImage(icons),
          SizedBox(width: 12),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyName,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16),
                ),
                Text('\$${priceNum.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                Text(
                  '$percentage%',
                  style: TextStyle(
                      color: _percentageColor(percentage),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                // ],
                // )
              ])
        ],
      ),
    );
  }

  CircleAvatar _getLeadingSavedWidget(var currencyName) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      child: Text(currencyName[0]),
    );
  }

  Widget _cryptoImage(String icons) {
    print(icons);
    return Container(
        height: MediaQuery.of(context).size.height / 20,
        child: Image.network(icons));
  }

  Container _getSubtitleSavedWidget(String high, String low) {
    return Container(
      height: 30,
      //color: Colors.pink,
      // alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'High: \$$high',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            'Low: \$$low',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  _percentageColor(String percentage) {
    if (percentage.contains('-'))
      return Colors.red;
    else
      return Colors.green;
  }
}
  // Text _getTitleWidget(String currencyName) {
  //   return Text(
  //     currencyName,
  //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  //   );
  // }

  // Text _getSubtitleWidget(String priceUsd) {
  //   return Text(
  //     '\$$priceUsd',
  //     style: TextStyle(color: Colors.white),
  //   );
  // }

