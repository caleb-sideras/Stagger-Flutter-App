import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:intl/intl.dart';
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'package:stagger_v3/bloc/kl_bloc.dart';
import 'package:stagger_v3/pages/symbol_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CryptoPage extends StatefulWidget {
  final temp cryptoData;
  const CryptoPage({required this.cryptoData, Key? key}) : super(key: key);
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  var buttonText = ['1H', '1D', '1W', '1M', '6M', '1Y', '5Y'];
  int buttonSelect = 0;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    // primary: Colors.black87,
    backgroundColor: Colors.pink,
    // padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  );
  final klBloc = klineBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            tooltip: 'Favorite',
            onPressed: () {
              // handle the press
            },
            color: Colors.white,
          ),
        ],
        
      ),
      backgroundColor: Colors.black,
      // backgroundColor: Colors.orange,
    );
  }

  @override
  void initState() {}

  Widget _buildBody() {
    var size = MediaQuery.of(context).size;
    var pageWidth = size.width;
    var pageHeight = size.height -
        kToolbarHeight -
        // kBottomNavigationBarHeight -
        kTextTabBarHeight;
    return SlidingUpPanel(
      color: widget.cryptoData.color!.color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      body: Column(
        children: [

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: pageWidth,
              height: pageHeight/1.35,
              decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFF333333)),
              child: Column(
                children: [
                  _graphHeader(pageWidth, pageHeight / 8),
                  _graphSection(pageWidth, pageHeight / 1.7),
                ],
              ),
            ),
          ),
         _graphButtons(pageWidth, pageHeight)
        ],
      ),
      panelBuilder: (ScrollController sc) =>
          _crypto24hDataGrid(sc, pageWidth, pageHeight),
      // return Stack(
      //     // width: size.width,
      //     // height: pageHeight,
      //     // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

      //       children: [
      //         _graphHeader(pageWidth, pageHeight / 8),
      //         Positioned(top: pageHeight/8,child: _graphSection(pageWidth, pageHeight / 2)),
      //         // _crypto24hData(pageWidth, pageHeight)
      //       ],
    );
  }

  Widget _graphSection(double pageWidth, double pageHeight) {
    // final klBloc = klineBloc();
    return Column(
      children: [
        StreamBuilder(
          stream: klBloc.getKline,
          initialData: [], //TODO   klBloc.addKline.add(['BTC', 0]);
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              width: pageWidth,
              height: pageHeight,
              child: OHLCVGraph(
                data: snapshot.data,
                enableGridLines: true,
                gridLineAmount: 2,
                // fallbackHeight: 50,
                // fallbackWidth: 50,
                volumeProp: 0.1,
                increaseColor: Color(0xFF9FCE88),
                decreaseColor: Color(0xFFE54C38),
              ),
            );
          },
        ),
        // StreamBuilder(
        //   stream: klBloc
        //       .updateButtonIndex, //TODO streambuilder into listview.toList() later :D color text
        //   initialData: 0,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     return Container(
        //       child: Container(
        //         height: pageHeight / 10,
        //         width: pageWidth,
        //         child: ListView.builder(
        //             itemCount: buttonText.length,
        //             scrollDirection: Axis.horizontal,
        //             itemBuilder: (context, index) {
        //               return TextButton(
        //                 onPressed: () {
        //                   klBloc.addKline.add([
        //                     widget.cryptoData.cgm!.symbol.toUpperCase(),
        //                     index
        //                   ]);
        //                   klBloc.buttonIndex.add(index);
        //                 },
        //                 style: TextButton.styleFrom(
        //                     backgroundColor: buttonColor(snapshot.data, index),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(40))),
        //                 child: Text(
        //                   buttonText[index],
        //                   style: TextStyle(color: Colors.black),
        //                 ),
        //               );
        //             }),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }

  Widget _graphButtons(double pageWidth, double pageHeight){
    return StreamBuilder(
              stream: klBloc
                  .updateButtonIndex, //TODO streambuilder into listview.toList() later :D color text
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: Container(
                    height: pageHeight / 15,
                    width: pageWidth,
                    child: ListView.builder(
                        itemCount: buttonText.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              klBloc.addKline.add([
                                widget.cryptoData.cgm!.symbol.toUpperCase(),
                                index
                              ]);
                              klBloc.buttonIndex.add(index);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: buttonColor(snapshot.data, index),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                            child: Text(
                              buttonText[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                  ),
                );
              },
            );
  }

  Color buttonColor(int snapshot, int index) {
    if (snapshot == index) {
      return widget.cryptoData.color!.color;
    }
    return Colors.transparent;
  }

  Color textColor(int snapshot, int index) {
    if (snapshot == index) {
      return widget.cryptoData.color!.titleTextColor;
    }
    return Colors.black;
  }

  Widget _graphHeader(double graphHeaderWidth, double graphHeaderHeight) {
    final headerData = widget.cryptoData.cgm;
    var f = NumberFormat.currency(locale: 'en_US', name: '\$');
    var d = NumberFormat.percentPattern();
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      // color: Colors.teal,
      width: graphHeaderWidth,
      height: graphHeaderHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: graphHeaderWidth / 6,
            child: Image.asset(
              'assets/crypto_icons/color/${headerData!.symbol}.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: graphHeaderWidth / 6,
            // color: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: graphHeaderWidth / 6,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(headerData.name, style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(
                  width: graphHeaderWidth / 18,
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        headerData.symbol.toUpperCase(),
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            // color: Colors.brown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  //  color: Colors.orange,
                  width: graphHeaderWidth / 2.5,
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        '${f.format(headerData.current_price)}(${headerData.price_change_24h.toStringAsFixed(1)})',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Row(
                  children: [
                    Container(
                      width: graphHeaderWidth / 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.green),
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            '${headerData.price_change_percentage_24h.toStringAsFixed(1)}%',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crypto24hDataGrid(
      ScrollController sc, double parentWidth, double parentHeight){
        var gridViewData = widget.cryptoData.cgm; 
    return GridView.count(
      controller: sc,
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      children: [
        _crypto24hData('High', gridViewData!.high_24h.toStringAsFixed(1), parentWidth, parentHeight),
        _crypto24hData('Low', gridViewData.low_24h.toStringAsFixed(1), parentWidth, parentHeight),
        _crypto24hData('Cap', gridViewData.market_cap.toStringAsFixed(1), parentWidth, parentHeight),
        _crypto24hData('Vol', gridViewData.total_volume.toStringAsFixed(1), parentWidth, parentHeight),
        _crypto24hData('C-Supply', gridViewData.circulating_supply.toStringAsFixed(1), parentWidth, parentHeight),
        // _crypto24hData('M-Supply', gridViewData.max_supply!.toStringAsFixed(1), parentWidth, parentHeight)

      ],
    );
  }
  

  Widget _crypto24hData(String title, String data, double parentWidth, double parentHeight){//double parentWidth, double parentHeight, ) {
    return Center(
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: parentWidth/2.5,
        height: parentHeight/9,
        
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF333333)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: parentWidth / 10,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(title, style: TextStyle(color: Colors.white),),
                  ),
                ),
              Container(
                  width: parentWidth / 8,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(data, style: TextStyle(color: Colors.white)),
                  ),
                ),
            ],
          )),
    );
  }
}
