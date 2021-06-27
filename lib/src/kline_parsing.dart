import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'at_serializer.dart';
import 'dart:convert' as json;

part 'kline_parsing.g.dart';

abstract class BinanceKline
    implements Built<BinanceKline, BinanceKlineBuilder> {
  static Serializer<BinanceKline> get serializer => _$binanceKlineSerializer;

    BuiltList<Kline> get kline;

  BinanceKline._();
  factory BinanceKline([void Function(BinanceKlineBuilder) updates]) =
      _$BinanceKline;
}

BuiltList<BinanceKline> kLineParseAllTickers(String jsonStr) {
   var parsed = json.jsonDecode(jsonStr);
  var kline = kLineStandardSerializers.deserialize(
      parsed,
      specifiedType: kLineBuiltList,
    ) as BuiltList<BinanceKline>;
  return kline;
}

class Kline{
  Kline();
    int? openTime;
    double? open;
     double? high;
     double? low;
    double? close;
    double? volume;
    int? closeTime;
    double? quoteVolume;
    int? tradesCount;
     double? takerBase;
     double? takerQuote;

}

enum Interval {
  oneMinute,
  threeMinutes,
  fiveMinutes,
  fifteenMinutes,
  thirtyMinutes,
  oneHour,
  twoHours,
  fourHours,
  sixHours,
  eightHours,
  twelveHours,
  oneDay,
  threeDays,
  oneWeek,
  oneMonth
}
