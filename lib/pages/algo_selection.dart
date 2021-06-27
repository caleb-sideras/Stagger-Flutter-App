import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';

class Selection extends StatefulWidget {
  Selection({Key? key}) : super(key: key);

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String? dropdownValue;
  List<String> titles = ['Crypto', 'Amount', 'Percent', 'Value'];
  var contents = <List<String>>[
    ['ADA', 'MATIC', 'ICP', 'USDT', 'LINK', 'DOT'],
    ['0.1', '0.5', '1', '5', '10', '50', '100'],
    ['0.5', '1', '5', '10', '20'],
    ['current']
  ];
  var cryptoPrice;
  var tempSelect = ['ADA', '1', '1', 'current', '0xFF9FCE88', 'Active', ''];
  // final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            children: [
              topInformation(itemWidth, acBloc),
              gridSelection(_accountCrypto, acBloc),
              enterButton(acBloc)
            ],
          ),
        ));
  }

  Widget topInformation(var itemWidth, var acBloc) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
      width: itemWidth,
      // color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.grey,
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 10),
          Text(
            'Total',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          StreamBuilder(
            stream: acBloc!.getSymbolPrice,
            initialData: '0.00',
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              tempSelect[6]= snapshot.data;
              return Text(
                '\$${snapshot.data}',
                style: TextStyle(color: Colors.white, fontSize: 38),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget gridSelection(var accountCrypto, var acBloc) {
    return Flexible(
      child:
          GridView.count(crossAxisCount: 2, childAspectRatio: 3 / 2, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 170,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF333333)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crypto',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                DropdownButton<String>(
                  value: tempSelect[0],
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 3,
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: Color(0xFF333333),
                  onChanged: (String? newValue) {
                    setState(() {
                      tempSelect[0] = newValue!;
                      acBloc.setSymbolPrice.add(newValue+'USDT');
                    });
                  },
                  items: accountCrypto
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 170,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF333333)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter amount",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      errorStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA7D0E3)),
                      ),
                    ),

                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      setState(() {
                        tempSelect[1] = newValue!;
                        if (newValue!=null) {
                           acBloc!.setCryptoAmount.add(newValue);
                        }
                       
                      });
                    }, // Only numbers can be entered
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 170,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF333333)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Percent',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter percent",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      errorStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA7D0E3)),
                      ),
                    ),

                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      setState(() {
                        tempSelect[2] = newValue!;
                      });
                    }, // Only numbers can be entered
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 170,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF333333)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Value',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                DropdownButton<String>(
                  value: 'Current',
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 3,
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: Color(0xFF333333),
                  // onChanged: (String? newValue) {
                  //   setState(() {
                  //     tempSelect[1] = newValue!;
                  //   });
                  // },
                  items: <String>['Current']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget enterButton(var acBloc) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      onPressed: () {
        // tempSelect[6]= cryptoPrice;
        acBloc.setAlgoInfo.add(tempSelect);
        Navigator.pop(context);
      },
      child: const Text('Enter'),
    );
  }
}
