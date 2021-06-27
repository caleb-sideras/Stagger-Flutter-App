import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:stagger_v3/rest/binance_rest.dart';

class klineBloc{
  Sink<List<dynamic>> get addKline => _addKlineController.sink;
  final _addKlineController = StreamController<List<dynamic>>();

  Stream<List<Map<String, double>>> get getKline => _getKlineSubject.stream;
  final _getKlineSubject = BehaviorSubject<List<Map<String, double>>>();

  Sink<int> get buttonIndex => _buttonIndexController.sink;
  final _buttonIndexController = StreamController<int>();

  Stream<int> get updateButtonIndex => _updateButtonIndexSubject.stream;
  final _updateButtonIndexSubject = BehaviorSubject<int>();

  var parsedKline = <Map<String, double>>[];

  klineBloc(){
    _addKlineController.stream.listen(_handle);

    _buttonIndexController.stream.listen(_handleButton);

    // _getKlineSubject.add(parsedKline);

  }

void _handleButton(int number){
  _updateButtonIndexSubject.add(number);
}
  void _handle(List<dynamic> klineInfo) {
      _updateKline(klineInfo).then((_) {
        _getKlineSubject.add(parsedKline);
      });
    }
  
  Future<void>_updateKline(List<dynamic> klineInfo) async {
    var interval = [];
    int intervalType = klineInfo[1];
    var now = DateTime.now();
    var startTime;
    
    switch (intervalType) {
      case 0:
        interval = [
          '5m',
          DateTime(now.year, now.month, now.day, now.hour - 1)
        ];
        break;
      case 1:
        interval = [
          '30m',
          DateTime(now.year, now.month, now.day - 1)
        ];
        break;
      case 2:
        interval = [
          '4h',
          DateTime(now.year, now.month, now.day - 7)
        ];
        break;
      case 3:
        interval = [
          '12h',
          DateTime(now.year, now.month - 1, now.day)
        ];
        break;
      case 4:
        interval = [
          '3d',
          DateTime(now.year, now.month - 6, now.day)
        ];
        break;
      case 5:
        interval = [
          '1w',
          DateTime(now.year - 1, now.month, now.day)
        ];
        break;
      case 6:
        interval = [
          '1m',
          DateTime(now.year - 5, now.month, now.day)
        ];
        break;
    }
    final tempKline = await BinanceRest().candlesticks(
        '${klineInfo[0]}USDT', interval[0],
        startTime: interval[1], endTime: now);

    parsedKline = tempKline;

  }
  
}