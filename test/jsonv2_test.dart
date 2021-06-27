import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:stagger_v3/bloc/ca_bloc.dart';
import 'dart:convert';
import 'package:stagger_v3/rest/binance_rest.dart';

void main() {
  test("parses item.json over http", () async {
    final url = Uri.parse('https://api.binance.com/api/v3/ticker/24hr?');

    final response = await http.get(url);
    var temp = parseAllTickers(response.body);
    print(temp.length);
    var i = temp.iterator;
    while (i.moveNext()) {
      print('Type: ${i.current.symbol}');
    }

    for (var j in temp) {
      print(j.volume);
    }
  });

  test("test2", () async {
    String symbolTickers24 = 'https://api.binance.com/api/v3/ticker/24hr?symbol=';
    String symbol = 'BTCUSDT';
  print(symbolTickers24+symbol);

   
  });

  test("paletterman", () async {

    

    // Future _paletterman() async{ //ImageProvider image
    final ImageProvider image = NetworkImage('https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579');
    final ImageProvider image2 = AssetImage('assets/images/tempimage2.png');
    // String src = "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579";
    // var temp = Image.network("https://cors-anywhere.herokuapp.com/"+ src);
    print(image);
    Rect? region;
    print(region);
    Size? tempsize = Size(400, 200);
    if (tempsize != null) {
      region = Offset.zero & tempsize;
    }
    print('$region $tempsize');
    
    PaletteGenerator? paletteGenerator; 
    print(paletteGenerator);
    paletteGenerator =await PaletteGenerator.fromImageProvider(
      image2,
      size: tempsize,
      region: region,
      maximumColorCount: 20,
    );
    // return paletteGenerator;
    
// }
    // print(paletteGenerator);

  });

  test('idiote', (){
 var _favCrypto = {
    ['Bitcoin', 'BTC'],
    ['Ethereum', 'ETH'],
    ['Cardano', 'ADA'],
    ['Dogecoin', 'DOGE'],
    ['Polkadot', 'DOT'],
    ['Chainlink', 'LINK'],
    ['Solana', 'SOL'],
    ['Algorand', 'ALGO']};

  // var _favCrypto = [
  //   {'Bitcoin', 'BTC'},
  //   {'Ethereum', 'ETH'},
  //   {'Cardano', 'ADA'},
  //   {'Dogecoin', 'DOGE'},
  //   {'Polkadot', 'DOT'},
  //   {'Chainlink', 'LINK'},
  //   {'Solana', 'SOL'},
  //   {'Algorand', 'ALGO'}];

    _favCrypto.add(['Dogecoin', 'DOGE']);

    
    print(_favCrypto.runtimeType);

    for (var item in _favCrypto) {
      print(item.first);
      print(item.last);
    }
    // var temp = {'asscoin', 'ASS'};
    // print('${temp.first} ${temp.last}');
    // temp.add('ASS');
    // for (var item in temp) {
    //   print(item);
    // }
  });

test('GeckoRest', () async{
  var temp = ['bitcoin', 'ethereum', 'cardano'];
  var temp2 = await CoinGeckoRest().market('usd', temp);
  print(temp2);
});
  
  test('BinanceAccount', () async{

    var temp =await BinanceRest().getBalance();
    print(temp);
    
  });

   test('BinancePrice', () async{

    var temp =await BinanceRest().getSymbolPrice('BTCUSDT');
    print(temp);
    
  });
}
