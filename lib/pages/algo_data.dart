import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';

class Data extends StatefulWidget {
  final cryptoData;
  Data({required this.cryptoData, Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  var tempList = [[
    'SELL',
      '1 LINKUSDT value: 18.7254',
      '1 LINKUSDT balance (sold) for : 18.7254 + 0.02',],
      ['BUY',
      '1 LINKUSDT value: 17.8635',
      '17.8635 USDT (bought): 1LINKUSDT']];
  @override
  Widget build(BuildContext context) {
    printData();
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    final double itemHeight = (size.height -
        // kToolbarHeight -
        kBottomNavigationBarHeight -
        kTextTabBarHeight);
    final acBloc = BlocProvider.of(context)!.accBloc;
    var _accountCrypto = acBloc!.getAccountCrypto();
    return Scaffold(
        backgroundColor: Color(0xFFA7D0E3),
        appBar: AppBar(
          backgroundColor: Color(0xFFA7D0E3),
          elevation: 0,
        ),
        body: Container(
          height: itemHeight,
          width: itemWidth,
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              // boxShadow: [
              //   BoxShadow(
              //         // color: Colors.grey,
              //         offset: Offset(0.0, 1.0), //(x,y)
              //         blurRadius: 6,
              //       ),
              // ],
              color: Color(0xFF1E1E1E)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey,
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: itemWidth / 1.875,
                    height: itemHeight / 7.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF333333)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: itemHeight / 12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.transparent),
                          child: Image.asset(
                            'assets/crypto_icons/color/${widget.cryptoData[0].toLowerCase()}.png',
                            fit: BoxFit.fitWidth,
                            // height: selected ? itemHeight / 24 : itemHeight / 12
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: itemWidth / 3,
                                height: itemHeight / 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.transparent,
                                ),
                                child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.cryptoData[0],
                                      style: TextStyle(color: Colors.white),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    widget.cryptoData[5],
                    style: TextStyle(
                        color: Color(int.parse(widget.cryptoData[4])),
                        fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Amount: ${widget.cryptoData[1]}',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Text(
                'Percent: ${widget.cryptoData[2]}',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Transactions',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 10,),
              Flexible(
                child: ListView.builder(
                  itemCount: tempList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${tempList[index][0]}', style: TextStyle(color: Colors.white, fontSize: 16)),
                            Text('${tempList[index][1]}', style: TextStyle(color: Colors.grey, fontSize: 16)),
                            Text('${tempList[index][2]}', style: TextStyle(color: Colors.grey, fontSize: 16)),
                          ],
                        )
                        
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  printData() {
    for (var item in widget.cryptoData) {
      print(item);
    }
  }
}
