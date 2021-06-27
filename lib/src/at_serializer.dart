library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:stagger_v3/src/at_parsing.dart';
import 'package:stagger_v3/src/cg_markets.dart';
import 'package:stagger_v3/src/kline_parsing.dart';

part 'at_serializer.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
const builtListTicker = FullType(
  BuiltList,
  [FullType(AllTickers)],
);

const gcBuiltListTicker = FullType(
  BuiltList,
  [FullType(CoinGeckoMarkets)],
);

const kLineBuiltList = FullType(
  BuiltList,
  [FullType(BinanceKline)],
);

@SerializersFor(const [AllTickers, CoinGeckoMarkets, BinanceKline])
Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()
      ..addBuilderFactory(
        builtListTicker,
        () => ListBuilder<AllTickers>(),
      )
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

Serializers gcStandardSerializers = (serializers.toBuilder()
      ..addBuilderFactory(
        gcBuiltListTicker,
        () => ListBuilder<CoinGeckoMarkets>(),
      )
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

Serializers kLineStandardSerializers = (serializers.toBuilder()
      ..addBuilderFactory(
        kLineBuiltList,
        () => ListBuilder<BinanceKline>(),
      )
      ..add(Iso8601DateTimeSerializer())
      // ..addPlugin(StandardJsonPlugin()
      // )
      )
    .build();