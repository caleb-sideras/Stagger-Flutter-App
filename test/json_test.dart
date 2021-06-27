import 'dart:convert' as json;

import 'package:http/http.dart' as http;
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stagger_v3/src/kline_parsing.dart';



void main() async {
  test("parses item.json", () async {
    // const jsonString = """{
    //   "e": "24hrTicker",
    //   "E": 123456789,
    //   "s": "ABC_0DX-BNB",
    //   "p": "0.0015",
    //   "P": "250.00",
    //   "w": "0.0018",
    //   "x": "0.0009",
    //   "c": "0.0025",
    //   "Q": "10",
    //   "b": "0.0024",
    //   "B": "10",
    //   "a": "0.0026",
    //   "A": "100",
    //   "o": "0.0010",
    //   "h": "0.0025",
    //   "l": "0.0010",
    //   "v": "10000",
    //   "q": "18",
    //   "O": 0,
    //   "C": 86400000,
    //   "F": "0",
    //   "L": "18150",
    //   "n": 18151
    // }""";
    // expect(parseAllTickers(jsonString)!.symbol, "BNBBTC");
    final url = Uri.parse('https://api.binance.com/api/v3/ticker/24hr?');
    final response = await http.get(url); //endTime.millisecondsSinceEpoch.toString()
    print(parseAllTickers(response.body));
  });

  test("parses kline.json over http", () async {
    var now = DateTime.now();
    var temp1 = DateTime(now.year, now.month, now.day-1, now.hour).millisecondsSinceEpoch.toString();
    var temp2 = now.millisecondsSinceEpoch.toString();

    final url = Uri.parse('https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=6h&startTime=$temp1&endTime=$temp2');
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
    for (var item in temp3) {
      print(item.runtimeType);
    }
  });
}
