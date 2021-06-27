// import 'package:built_collection/built_collection.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'at_serializer.dart';
import 'dart:convert' as json;


part 'cg_markets.g.dart';

abstract class CoinGeckoMarkets implements Built<CoinGeckoMarkets, CoinGeckoMarketsBuilder> {
  static Serializer<CoinGeckoMarkets> get serializer => _$coinGeckoMarketsSerializer;

  String get id;
  String get symbol;
  String get name;
  String get image;
  double get current_price;
  int get market_cap;
  int get market_cap_rank;
  // int get fully_diluted_valuation;
  int get total_volume;
  double get high_24h;
  double get low_24h;
  double get price_change_24h;
  double get price_change_percentage_24h;
  double get market_cap_change_24h;
  double get market_cap_change_percentage_24h;
  double get circulating_supply;
  double? get total_supply;
  double? get max_supply;
  double get ath;
  double get ath_change_percentage;
  String get ath_date;
  double get atl;
  double get atl_change_percentage;
  String get atl_date;
  // bool? get roi;
  String get last_updated;

  CoinGeckoMarkets._();
  factory CoinGeckoMarkets([void Function(CoinGeckoMarketsBuilder) updates]) = _$CoinGeckoMarkets;
}

BuiltList<CoinGeckoMarkets> cgParseAllTickers(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  var ticker = gcStandardSerializers.deserialize(
      parsed,
      specifiedType: gcBuiltListTicker,
    ) as BuiltList<CoinGeckoMarkets>;
  return ticker;
}

// List<String> parseGCFavoriteCrypto(String jsonStr) {
//   final parsed = json.jsonDecode(jsonStr);
//   final listOfIds = List<String>.from(parsed);
//   return listOfIds;
// }

// CoinGeckoMarkets? parseGCFavorite(String jsonStr) {
//   final parsed = json.jsonDecode(jsonStr);
//   CoinGeckoMarkets? ticker =
//       gcStandardSerializers.deserializeWith(CoinGeckoMarkets.serializer, parsed);
//   return ticker;
// }
