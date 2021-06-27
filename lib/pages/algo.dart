import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stagger_v3/bloc/bloc_provider.dart';
import 'package:stagger_v3/pages/algo_data.dart';

import 'algo_selection.dart';

class Algorithm extends StatefulWidget {
  Algorithm({Key? key}) : super(key: key);

  @override
  _AlgorithmState createState() => _AlgorithmState();
}

class _AlgorithmState extends State<Algorithm> {
  @override
  Widget build(BuildContext context) {
    final acBloc = BlocProvider.of(context)!.accBloc;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Align(
          child: Image.asset('assets/images/StaggerLogo6.png', height: 40),
          alignment: Alignment.center,
        ),
        backgroundColor: Color(0xFF1E1E1E), //Color(0xFFB5D3E3),
        elevation: 0,
      ),
      body: Row(
        children: [algoList(acBloc)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Selection(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
      ),
    );
  }

  Widget algoList(var acBloc) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24);
    final double itemWidth = size.width;
    return Flexible(
      child: StreamBuilder(
          stream: acBloc.getAlgoInfo,
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) => ListView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(), //ClampingScrollPhysics
                children: snapshot.data
                    .map<Widget>((post) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           Data(cryptoData:post)),
                                  );
                                 
                                },
                          child: Container(
                            width: itemWidth / 1.1,
                            height: itemHeight / 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF1E1E1E)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: itemWidth / 2.5,
                                  height: itemHeight / 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                        child: Image.asset(
                                          'assets/crypto_icons/color/${post[0].toLowerCase()}.png',
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
                                                    BorderRadius.circular(0),
                                                color: Colors.transparent,
                                              ),
                                              child: FittedBox(
                                                  fit: BoxFit.fitHeight,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    post[0],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: itemWidth / 2.5,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Amount: ${post[1]}', style: const TextStyle(color: Colors.white)),
                                          Text('Percent: ${post[2]}%', style: const TextStyle(color: Colors.white)),
                                          Text(post[5], style: TextStyle(color: Color(int.parse(post[4]))))
                        
                                        ]))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ))
                    .toList(),
              )),
    );
  }
}
