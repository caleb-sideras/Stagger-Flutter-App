import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class BinanceRest {


  String _totalBalance = '0';
  var _balance = <dynamic>[];

  _hmacSha256(String message, String secret) {
  var key = convert.utf8.encode(secret);
  var msg = convert.utf8.encode(message);
  var hmac = Hmac(sha256, key);
  var signature = hmac.convert(msg).toString();

  return signature;
}

  Future<dynamic> _public(String path, [Map<String, String?>? params]) async {
    final uri = Uri.https('api.binance.com', 'api$path', params);
    final response = await http.get(uri);

    final result = convert.jsonDecode(response.body);

    return result;
  }

  Future<dynamic> candlesticks(
    String symbol,
    String interval, {
    DateTime? startTime,
    DateTime? endTime,
    int? limit = 500,
  }) async {
    final params = <String, String>{
      'symbol': '$symbol',
      'interval': '$interval',
      'limit': '$limit',
    };

    if (startTime != null) {
      params['startTime'] = startTime.millisecondsSinceEpoch.toString();
    }
    if (endTime != null) {
      params['endTime'] = endTime.millisecondsSinceEpoch.toString();
    }

    final response = await _public('/v3/klines', params);
    final parsedKline = parseKline(response);
    return parsedKline;
  }

  List<Map<String, double>> parseKline(var tempKline) {
    var parsedKline =<Map<String, double>>[];
    for (var item in tempKline) {
      parsedKline.add({
        "open": double.parse(item[1]),
        "high": double.parse(item[2]),
        "low": double.parse(item[3]),
        "close": double.parse(item[4]),
        "volumeto": double.parse(item[5]),
      });
    }
    return parsedKline;
  }

  Future<dynamic> account() async{
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String query = 'recvWindow=60000' + '&' + 'timestamp=' + timestamp; //'recvWindow=60000' + '&' 
      String signature = _hmacSha256(query, _secret);
      final params = <String, String>{
        'recvWindow' : '60000',
        'timestamp' : timestamp,
        'signature' : signature,
      };

      final uri = Uri.https('api.binance.com', 'api/v3/account', params);
      final response = await http.get(uri, headers: {'X-MBX-APIKEY': _apiKey});
      final result = convert.jsonDecode(response.body);
      return result;
      
  }

  Future<bool> getPortfolio() async{
    
      var result = await account();//BinanceRest().
      // print(result);
      var allBalance = result['balances'];
      var balance = [];
      var price;
      double total = 0;
      for (var res in allBalance) {
        if (double.parse(res['free'])> 0) {
          var symbolData;
          if (res['asset']=='USDT') {
            // symbolData = {
            //   'symbol' : 'USDT',
            //   'price' : res['free']};
              price = res['free'];
              total += double.parse(price);
          }
          else{
            symbolData = await getSymbolPrice('${res['asset']}USDT');//BinanceRest().getSymbolPrice('${res['asset']}USDT');
            price =  (double.parse(symbolData['price']) * double.parse(res["free"])).toStringAsFixed(2);
            total += double.parse(price);
          }     
          final params = <String, String>{
          'asset' : res['asset'],
          'free' : res['free'],
          'price' : price,
          // 'total' : total.toStringAsFixed(2),
          };
          balance.add(params);
        }
      }
      print('${total.toStringAsFixed(2)}, hello');
      _totalBalance = total.toStringAsFixed(2);
      // print('hello');
      _balance = balance;   
      // print(_balance);
      return true; 
  }

  String getTotalBalance() {
    // await getPortfolio();
    return _totalBalance;
  }

  List<dynamic> getTotalPortfolio(){
    return _balance;
  }

  Future<dynamic> getSymbolPrice(String symbol) async{
    final params = <String, String>{
      'symbol': '$symbol',
    };

    final response = _public('/v3/ticker/price', params); 
    return response;
  }
}