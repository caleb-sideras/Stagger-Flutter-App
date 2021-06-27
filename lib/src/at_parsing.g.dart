// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'at_parsing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllTickers> _$allTickersSerializer = new _$AllTickersSerializer();

class _$AllTickersSerializer implements StructuredSerializer<AllTickers> {
  @override
  final Iterable<Type> types = const [AllTickers, _$AllTickers];
  @override
  final String wireName = 'AllTickers';

  @override
  Iterable<Object?> serialize(Serializers serializers, AllTickers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'symbol',
      serializers.serialize(object.symbol,
          specifiedType: const FullType(String)),
      'priceChange',
      serializers.serialize(object.priceChange,
          specifiedType: const FullType(String)),
      'priceChangePercent',
      serializers.serialize(object.priceChangePercent,
          specifiedType: const FullType(String)),
      'weightedAvgPrice',
      serializers.serialize(object.weightedAvgPrice,
          specifiedType: const FullType(String)),
      'prevClosePrice',
      serializers.serialize(object.prevClosePrice,
          specifiedType: const FullType(String)),
      'lastPrice',
      serializers.serialize(object.lastPrice,
          specifiedType: const FullType(String)),
      'lastQty',
      serializers.serialize(object.lastQty,
          specifiedType: const FullType(String)),
      'bidPrice',
      serializers.serialize(object.bidPrice,
          specifiedType: const FullType(String)),
      'askPrice',
      serializers.serialize(object.askPrice,
          specifiedType: const FullType(String)),
      'openPrice',
      serializers.serialize(object.openPrice,
          specifiedType: const FullType(String)),
      'highPrice',
      serializers.serialize(object.highPrice,
          specifiedType: const FullType(String)),
      'lowPrice',
      serializers.serialize(object.lowPrice,
          specifiedType: const FullType(String)),
      'volume',
      serializers.serialize(object.volume,
          specifiedType: const FullType(String)),
      'quoteVolume',
      serializers.serialize(object.quoteVolume,
          specifiedType: const FullType(String)),
      'openTime',
      serializers.serialize(object.openTime,
          specifiedType: const FullType(int)),
      'closeTime',
      serializers.serialize(object.closeTime,
          specifiedType: const FullType(int)),
      'firstId',
      serializers.serialize(object.firstId, specifiedType: const FullType(int)),
      'lastId',
      serializers.serialize(object.lastId, specifiedType: const FullType(int)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  AllTickers deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllTickersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priceChange':
          result.priceChange = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priceChangePercent':
          result.priceChangePercent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'weightedAvgPrice':
          result.weightedAvgPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prevClosePrice':
          result.prevClosePrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastPrice':
          result.lastPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastQty':
          result.lastQty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bidPrice':
          result.bidPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'askPrice':
          result.askPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'openPrice':
          result.openPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'highPrice':
          result.highPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lowPrice':
          result.lowPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quoteVolume':
          result.quoteVolume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'openTime':
          result.openTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'closeTime':
          result.closeTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'firstId':
          result.firstId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lastId':
          result.lastId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AllTickers extends AllTickers {
  @override
  final String symbol;
  @override
  final String priceChange;
  @override
  final String priceChangePercent;
  @override
  final String weightedAvgPrice;
  @override
  final String prevClosePrice;
  @override
  final String lastPrice;
  @override
  final String lastQty;
  @override
  final String bidPrice;
  @override
  final String askPrice;
  @override
  final String openPrice;
  @override
  final String highPrice;
  @override
  final String lowPrice;
  @override
  final String volume;
  @override
  final String quoteVolume;
  @override
  final int openTime;
  @override
  final int closeTime;
  @override
  final int firstId;
  @override
  final int lastId;
  @override
  final int count;

  factory _$AllTickers([void Function(AllTickersBuilder)? updates]) =>
      (new AllTickersBuilder()..update(updates)).build();

  _$AllTickers._(
      {required this.symbol,
      required this.priceChange,
      required this.priceChangePercent,
      required this.weightedAvgPrice,
      required this.prevClosePrice,
      required this.lastPrice,
      required this.lastQty,
      required this.bidPrice,
      required this.askPrice,
      required this.openPrice,
      required this.highPrice,
      required this.lowPrice,
      required this.volume,
      required this.quoteVolume,
      required this.openTime,
      required this.closeTime,
      required this.firstId,
      required this.lastId,
      required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(symbol, 'AllTickers', 'symbol');
    BuiltValueNullFieldError.checkNotNull(
        priceChange, 'AllTickers', 'priceChange');
    BuiltValueNullFieldError.checkNotNull(
        priceChangePercent, 'AllTickers', 'priceChangePercent');
    BuiltValueNullFieldError.checkNotNull(
        weightedAvgPrice, 'AllTickers', 'weightedAvgPrice');
    BuiltValueNullFieldError.checkNotNull(
        prevClosePrice, 'AllTickers', 'prevClosePrice');
    BuiltValueNullFieldError.checkNotNull(lastPrice, 'AllTickers', 'lastPrice');
    BuiltValueNullFieldError.checkNotNull(lastQty, 'AllTickers', 'lastQty');
    BuiltValueNullFieldError.checkNotNull(bidPrice, 'AllTickers', 'bidPrice');
    BuiltValueNullFieldError.checkNotNull(askPrice, 'AllTickers', 'askPrice');
    BuiltValueNullFieldError.checkNotNull(openPrice, 'AllTickers', 'openPrice');
    BuiltValueNullFieldError.checkNotNull(highPrice, 'AllTickers', 'highPrice');
    BuiltValueNullFieldError.checkNotNull(lowPrice, 'AllTickers', 'lowPrice');
    BuiltValueNullFieldError.checkNotNull(volume, 'AllTickers', 'volume');
    BuiltValueNullFieldError.checkNotNull(
        quoteVolume, 'AllTickers', 'quoteVolume');
    BuiltValueNullFieldError.checkNotNull(openTime, 'AllTickers', 'openTime');
    BuiltValueNullFieldError.checkNotNull(closeTime, 'AllTickers', 'closeTime');
    BuiltValueNullFieldError.checkNotNull(firstId, 'AllTickers', 'firstId');
    BuiltValueNullFieldError.checkNotNull(lastId, 'AllTickers', 'lastId');
    BuiltValueNullFieldError.checkNotNull(count, 'AllTickers', 'count');
  }

  @override
  AllTickers rebuild(void Function(AllTickersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllTickersBuilder toBuilder() => new AllTickersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllTickers &&
        symbol == other.symbol &&
        priceChange == other.priceChange &&
        priceChangePercent == other.priceChangePercent &&
        weightedAvgPrice == other.weightedAvgPrice &&
        prevClosePrice == other.prevClosePrice &&
        lastPrice == other.lastPrice &&
        lastQty == other.lastQty &&
        bidPrice == other.bidPrice &&
        askPrice == other.askPrice &&
        openPrice == other.openPrice &&
        highPrice == other.highPrice &&
        lowPrice == other.lowPrice &&
        volume == other.volume &&
        quoteVolume == other.quoteVolume &&
        openTime == other.openTime &&
        closeTime == other.closeTime &&
        firstId == other.firstId &&
        lastId == other.lastId &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                symbol
                                                                                    .hashCode),
                                                                            priceChange
                                                                                .hashCode),
                                                                        priceChangePercent
                                                                            .hashCode),
                                                                    weightedAvgPrice
                                                                        .hashCode),
                                                                prevClosePrice
                                                                    .hashCode),
                                                            lastPrice.hashCode),
                                                        lastQty.hashCode),
                                                    bidPrice.hashCode),
                                                askPrice.hashCode),
                                            openPrice.hashCode),
                                        highPrice.hashCode),
                                    lowPrice.hashCode),
                                volume.hashCode),
                            quoteVolume.hashCode),
                        openTime.hashCode),
                    closeTime.hashCode),
                firstId.hashCode),
            lastId.hashCode),
        count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllTickers')
          ..add('symbol', symbol)
          ..add('priceChange', priceChange)
          ..add('priceChangePercent', priceChangePercent)
          ..add('weightedAvgPrice', weightedAvgPrice)
          ..add('prevClosePrice', prevClosePrice)
          ..add('lastPrice', lastPrice)
          ..add('lastQty', lastQty)
          ..add('bidPrice', bidPrice)
          ..add('askPrice', askPrice)
          ..add('openPrice', openPrice)
          ..add('highPrice', highPrice)
          ..add('lowPrice', lowPrice)
          ..add('volume', volume)
          ..add('quoteVolume', quoteVolume)
          ..add('openTime', openTime)
          ..add('closeTime', closeTime)
          ..add('firstId', firstId)
          ..add('lastId', lastId)
          ..add('count', count))
        .toString();
  }
}

class AllTickersBuilder implements Builder<AllTickers, AllTickersBuilder> {
  _$AllTickers? _$v;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  String? _priceChange;
  String? get priceChange => _$this._priceChange;
  set priceChange(String? priceChange) => _$this._priceChange = priceChange;

  String? _priceChangePercent;
  String? get priceChangePercent => _$this._priceChangePercent;
  set priceChangePercent(String? priceChangePercent) =>
      _$this._priceChangePercent = priceChangePercent;

  String? _weightedAvgPrice;
  String? get weightedAvgPrice => _$this._weightedAvgPrice;
  set weightedAvgPrice(String? weightedAvgPrice) =>
      _$this._weightedAvgPrice = weightedAvgPrice;

  String? _prevClosePrice;
  String? get prevClosePrice => _$this._prevClosePrice;
  set prevClosePrice(String? prevClosePrice) =>
      _$this._prevClosePrice = prevClosePrice;

  String? _lastPrice;
  String? get lastPrice => _$this._lastPrice;
  set lastPrice(String? lastPrice) => _$this._lastPrice = lastPrice;

  String? _lastQty;
  String? get lastQty => _$this._lastQty;
  set lastQty(String? lastQty) => _$this._lastQty = lastQty;

  String? _bidPrice;
  String? get bidPrice => _$this._bidPrice;
  set bidPrice(String? bidPrice) => _$this._bidPrice = bidPrice;

  String? _askPrice;
  String? get askPrice => _$this._askPrice;
  set askPrice(String? askPrice) => _$this._askPrice = askPrice;

  String? _openPrice;
  String? get openPrice => _$this._openPrice;
  set openPrice(String? openPrice) => _$this._openPrice = openPrice;

  String? _highPrice;
  String? get highPrice => _$this._highPrice;
  set highPrice(String? highPrice) => _$this._highPrice = highPrice;

  String? _lowPrice;
  String? get lowPrice => _$this._lowPrice;
  set lowPrice(String? lowPrice) => _$this._lowPrice = lowPrice;

  String? _volume;
  String? get volume => _$this._volume;
  set volume(String? volume) => _$this._volume = volume;

  String? _quoteVolume;
  String? get quoteVolume => _$this._quoteVolume;
  set quoteVolume(String? quoteVolume) => _$this._quoteVolume = quoteVolume;

  int? _openTime;
  int? get openTime => _$this._openTime;
  set openTime(int? openTime) => _$this._openTime = openTime;

  int? _closeTime;
  int? get closeTime => _$this._closeTime;
  set closeTime(int? closeTime) => _$this._closeTime = closeTime;

  int? _firstId;
  int? get firstId => _$this._firstId;
  set firstId(int? firstId) => _$this._firstId = firstId;

  int? _lastId;
  int? get lastId => _$this._lastId;
  set lastId(int? lastId) => _$this._lastId = lastId;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  AllTickersBuilder();

  AllTickersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _symbol = $v.symbol;
      _priceChange = $v.priceChange;
      _priceChangePercent = $v.priceChangePercent;
      _weightedAvgPrice = $v.weightedAvgPrice;
      _prevClosePrice = $v.prevClosePrice;
      _lastPrice = $v.lastPrice;
      _lastQty = $v.lastQty;
      _bidPrice = $v.bidPrice;
      _askPrice = $v.askPrice;
      _openPrice = $v.openPrice;
      _highPrice = $v.highPrice;
      _lowPrice = $v.lowPrice;
      _volume = $v.volume;
      _quoteVolume = $v.quoteVolume;
      _openTime = $v.openTime;
      _closeTime = $v.closeTime;
      _firstId = $v.firstId;
      _lastId = $v.lastId;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllTickers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllTickers;
  }

  @override
  void update(void Function(AllTickersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllTickers build() {
    final _$result = _$v ??
        new _$AllTickers._(
            symbol: BuiltValueNullFieldError.checkNotNull(
                symbol, 'AllTickers', 'symbol'),
            priceChange: BuiltValueNullFieldError.checkNotNull(
                priceChange, 'AllTickers', 'priceChange'),
            priceChangePercent: BuiltValueNullFieldError.checkNotNull(
                priceChangePercent, 'AllTickers', 'priceChangePercent'),
            weightedAvgPrice: BuiltValueNullFieldError.checkNotNull(
                weightedAvgPrice, 'AllTickers', 'weightedAvgPrice'),
            prevClosePrice: BuiltValueNullFieldError.checkNotNull(
                prevClosePrice, 'AllTickers', 'prevClosePrice'),
            lastPrice: BuiltValueNullFieldError.checkNotNull(
                lastPrice, 'AllTickers', 'lastPrice'),
            lastQty: BuiltValueNullFieldError.checkNotNull(
                lastQty, 'AllTickers', 'lastQty'),
            bidPrice: BuiltValueNullFieldError.checkNotNull(
                bidPrice, 'AllTickers', 'bidPrice'),
            askPrice:
                BuiltValueNullFieldError.checkNotNull(askPrice, 'AllTickers', 'askPrice'),
            openPrice: BuiltValueNullFieldError.checkNotNull(openPrice, 'AllTickers', 'openPrice'),
            highPrice: BuiltValueNullFieldError.checkNotNull(highPrice, 'AllTickers', 'highPrice'),
            lowPrice: BuiltValueNullFieldError.checkNotNull(lowPrice, 'AllTickers', 'lowPrice'),
            volume: BuiltValueNullFieldError.checkNotNull(volume, 'AllTickers', 'volume'),
            quoteVolume: BuiltValueNullFieldError.checkNotNull(quoteVolume, 'AllTickers', 'quoteVolume'),
            openTime: BuiltValueNullFieldError.checkNotNull(openTime, 'AllTickers', 'openTime'),
            closeTime: BuiltValueNullFieldError.checkNotNull(closeTime, 'AllTickers', 'closeTime'),
            firstId: BuiltValueNullFieldError.checkNotNull(firstId, 'AllTickers', 'firstId'),
            lastId: BuiltValueNullFieldError.checkNotNull(lastId, 'AllTickers', 'lastId'),
            count: BuiltValueNullFieldError.checkNotNull(count, 'AllTickers', 'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
