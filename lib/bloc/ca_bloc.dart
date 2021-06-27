import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:stagger_v3/src/cg_markets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';
import 'package:stagger_v3/bloc/fav_bloc.dart';
import 'package:stagger_v3/rest/binance_rest.dart';

class CryptoAllBloc {
  final FavBloc? _favBloc;

  Stream<BuiltList<CoinGeckoMarkets>> get allTickers => _allTickersSubject.stream;
  final _allTickersSubject = BehaviorSubject<BuiltList<CoinGeckoMarkets>>();

  Stream<List<AllTickers?>> get symbolTickers => _symbolTickersSubject.stream;
  final _symbolTickersSubject = BehaviorSubject<List<AllTickers?>>();

  Stream<BuiltList<CoinGeckoMarkets>> get gcSymbolMarkets =>
      _gcSymbolMarketsSubject.stream;
  final _gcSymbolMarketsSubject =
      BehaviorSubject<BuiltList<CoinGeckoMarkets>>();

  Stream<List<PaletteColor?>> get cardColor => _cardColorSubject.stream;
  final _cardColorSubject = BehaviorSubject<List<PaletteColor?>>();

  Stream<List<temp>> get gcSC => _gcSCSubject.stream;
  final _gcSCSubject = BehaviorSubject<List<temp>>();

  // var _crypto = BuiltList<AllTickers>([]);
  // var _crypto = <AllTickers?>[];
  var _crypto = BuiltList<CoinGeckoMarkets>([]);
  var _favorites = <AllTickers?>[];
  var _gcFavorites = BuiltList<CoinGeckoMarkets>([]);
  var _colors = <PaletteColor>[];
  var _cgFavoriteColor = <temp>[];

  String allTickers24 = 'https://api.binance.com/api/v3/ticker/24hr?';

  var _favList = <List<String>>[];
  var _favGecko = <String>[];
  var _favBinance = <String>[];
  var _favKline = <List<Map<String, double>>>[];
  var _cryptoPage = <Map<String, double>>[];

  CryptoAllBloc(this._favBloc) {
    _favBloc!.getFavorites.listen(_handleFavorites);

    _updateCrypto().then((_) {
      _allTickersSubject.add(_crypto);
    });

    // _updateFavorites().then((_) {
    //   _symbolTickersSubject.add(_favorites);
    // });

    //  _cgUpdateFavorites().then((_) {
    //   _gcSymbolMarketsSubject.add(_gcFavorites);
    //   _cardColorSubject.add(_colors);
    // });

    // _updateColorType().then((_) {
    //   _gcSCSubject.add(_cgFavoriteColor);
    // });
  }

  void _handleFavorites(List<List<String>> favList) {
    var tempGecko = <String>[];
    var tempBinance = <String>[];
    for (var item in favList) {
      tempGecko.add(item.first);
      tempBinance.add(item.last);
    }

    _favGecko = tempGecko;
    _favBinance = tempBinance;

    // print(_favGecko);
    // print(_favBinance);

    if (_favGecko.isNotEmpty || _favBinance.isNotEmpty) {
      _updateColorType().then((_) {
        _gcSCSubject.add(_cgFavoriteColor);
      });
    }
  }

  Future<BuiltList<CoinGeckoMarkets>> _getCrypto() async {
    // final temp = Uri.parse(allTickers24);
    var response = await CoinGeckoRest().market('usd');
    print(response);
    // final response = await http.get(temp);
    // return parseAllTickers(response.body);
    return cgParseAllTickers(response.body);
  }

  Future<Null> _updateCrypto() async {
    // List<AllTickers?> temp = [];
    await _getCrypto().then((posts) {
      // for (var item in posts) {
      //   if (item.symbol.contains('USDT')) {
      //     temp.add(item);
      //   }
      // }
      // print(temp);
      _crypto = posts;
    });
  }

  // Future<AllTickers?> _getFavorite(String symbol) async {
  //   final temp = Uri.parse(symbolTickers24 + symbol);
  //   final storyRes = await http.get(temp);
  //   if (storyRes.statusCode == 200) {
  //     return parseFavorite(storyRes.body);
  //   }
  // }

  // Future<Null> _updateFavorites() async {
  //   final futureFavorite = _favoriteSymbols.map((id) => _getFavorite(id));
  //   final favorites = await Future.wait(futureFavorite);
  //   _favorites = favorites;
  // }

  Future<BuiltList<CoinGeckoMarkets>> _gcGetCrypto() async {
    var response = await CoinGeckoRest().market('usd', ids: _favGecko);
    return cgParseAllTickers(response.body);
  }

  Future<Null> _cgAddFavorites() async {
    await _gcGetCrypto().then((posts) {
      _gcFavorites = posts;
    });
  }

  Future<void> _addPalettes() async {
    var list1 = <PaletteColor>[];
    for (var item in _gcFavorites) {
      PaletteGenerator? paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        AssetImage('assets/crypto_icons/color/${item.symbol}.png'),
        size: const Size(250, 250),
        region: const Rect.fromLTRB(0.0, 0.0, 250.0, 250.0),
      );
      var hexColor = paletteGenerator.paletteColors[11]; //2,8,11
      list1.add(hexColor);
    }
    _colors = list1;
  }

  Future<void> _addKLines() async {
    var now = DateTime.now();
    var dayBefore = DateTime(now.year, now.month, now.day - 1, now.hour);

    var tempParsedKlineList = <List<Map<String, double>>>[];
    var temp3 = <Map<String, double>>[];
    for (var symbol in _favBinance) {
      final tempKline = await BinanceRest().candlesticks('${symbol}USDT', '4h',
          startTime: dayBefore, endTime: now);

      // var tempParsedKline = parseKline(tempKline);

      // for (var item in tempKline) {
      //   tempParsedKline.add({
      //     "open": double.parse(item[1]),
      //     "high": double.parse(item[2]),
      //     "low": double.parse(item[3]),
      //     "close": double.parse(item[4]),
      //     "volumeto": double.parse(item[5]),
      //   });
      // }

      tempParsedKlineList.add(tempKline);
    }
    _favKline = tempParsedKlineList;
  }

  Future<dynamic> _getKLines(String symbol, String interval, DateTime startTime,
      DateTime endTime) async {
    final tempKline = await BinanceRest().candlesticks(
        '${symbol}USDT', interval,
        startTime: startTime, endTime: endTime);

    // var parsedData = parseKline(tempKline);
    // return parseKline(tempKline);
    return tempKline;
  }

  // List<Map<String, double>> parseKline(var tempKline) {
  //   var parsedKline =<Map<String, double>>[];
  //   for (var item in tempKline) {
  //     parsedKline.add({
  //       "open": double.parse(item[1]),
  //       "high": double.parse(item[2]),
  //       "low": double.parse(item[3]),
  //       "close": double.parse(item[4]),
  //       "volumeto": double.parse(item[5]),
  //     });
  //   }
  //   return parsedKline;
  // }

  Future<Null> _updateColorType() async {
    await _cgAddFavorites();
    await _addPalettes();
    await _addKLines();
    var temp2 = <temp>[];
    for (var i = 0; i < _gcFavorites.length; i++) {
      var temp3 = temp();
      temp3.cgm = _gcFavorites[i];
      temp3.color = _colors[i];
      temp3.kline = _favKline[i];
      temp2.add(temp3);
    }
    _cgFavoriteColor = temp2;
  }
}

class temp {
  CoinGeckoMarkets? cgm;
  PaletteColor? color;
  List<Map<String, double>>? kline;
}

class CoinGeckoRest {
  Future<dynamic> _public(String path, [Map<String, String?>? params]) async {
    final uri = Uri.https('api.coingecko.com', 'api$path', params);
    final response = await http.get(uri);
    // final result = convert.jsonDecode(response.body);

    return response;
  }

  Future<dynamic> market(String currency, {List<String>? ids}) async {

    var params;
    if (ids == null) {
      params = <String, String>{
        'vs_currency': '$currency',
        'order': 'market_cap_desc',
      };
    } else {
      params = <String, String>{
        'vs_currency': '$currency',
        'ids': ids.join(','),
        'order': 'market_cap_desc',
      };
    }

    final response = await _public('/v3/coins/markets', params);
    return response;
  }
}

// class BinanceRest {
//   Future<dynamic> _public(String path, [Map<String, String?>? params]) async {
//     final uri = Uri.https('api.binance.com', 'api$path', params);
//     final response = await http.get(uri);

//     final result = convert.jsonDecode(response.body);

//     return result;
//   }

//   Future<dynamic> candlesticks(
//     String symbol,
//     String interval, {
//     DateTime? startTime,
//     DateTime? endTime,
//     int? limit = 500,
//   }) async {
//     final params = <String, String>{
//       'symbol': '$symbol',
//       'interval': '$interval',
//       'limit': '$limit',
//     };

//     if (startTime != null) {
//       params['startTime'] = startTime.millisecondsSinceEpoch.toString();
//     }
//     if (endTime != null) {
//       params['endTime'] = endTime.millisecondsSinceEpoch.toString();
//     }

//     final response = await _public('/v3/klines', params);
//     return response;
//   }
// }
