import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'at_serializer.dart';
import 'st_serializer.dart';
import 'dart:convert' as json;


part 'at_parsing.g.dart';

abstract class AllTickers implements Built<AllTickers, AllTickersBuilder> {
  static Serializer<AllTickers> get serializer => _$allTickersSerializer;
  
  // String get e;
  // int get E;
  // String get s;
  // String get p;
  // String get P;
  // String get w;
  // String get x;
  // String get c;
  // String get Q;
  // String get b;
  // String get B;
  // String get a;
  // String get A;
  // String get o;
  // String get h;
  // String get l;
  // String get v;
  // String get q;
  // int get O;
  // int get C;
  // String get F;
  // String get L;
  // int get n;
    
  String get symbol;
  String get priceChange;
  String get priceChangePercent;
  String get weightedAvgPrice;
  String get prevClosePrice;
  String get lastPrice;
  String get lastQty;
  String get bidPrice;
  String get askPrice;
  String get openPrice;
  String get highPrice;
  String get lowPrice;
  String get volume;
  String get quoteVolume;
  int get openTime;
  int get closeTime;
  int get firstId;
  int get lastId;
  int get count;

  AllTickers._();
  factory AllTickers([void Function(AllTickersBuilder) updates]) = _$AllTickers;
}

BuiltList<AllTickers> parseAllTickers(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  var ticker = standardSerializers.deserialize(
      parsed,
      specifiedType: builtListTicker,
    ) as BuiltList<AllTickers>;
  return ticker;
}

// List<int> parseFavoriteCrypto(String jsonStr) {
//   final parsed = json.jsonDecode(jsonStr);
//   final listOfIds = List<int>.from(parsed);
//   return listOfIds;
// }

AllTickers? parseFavorite(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  AllTickers? ticker =
      stStandardSerializers.deserializeWith(AllTickers.serializer, parsed);
  return ticker;
}
