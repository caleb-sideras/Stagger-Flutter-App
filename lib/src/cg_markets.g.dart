// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cg_markets.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CoinGeckoMarkets> _$coinGeckoMarketsSerializer =
    new _$CoinGeckoMarketsSerializer();

class _$CoinGeckoMarketsSerializer
    implements StructuredSerializer<CoinGeckoMarkets> {
  @override
  final Iterable<Type> types = const [CoinGeckoMarkets, _$CoinGeckoMarkets];
  @override
  final String wireName = 'CoinGeckoMarkets';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoinGeckoMarkets object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'symbol',
      serializers.serialize(object.symbol,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'current_price',
      serializers.serialize(object.current_price,
          specifiedType: const FullType(double)),
      'market_cap',
      serializers.serialize(object.market_cap,
          specifiedType: const FullType(int)),
      'market_cap_rank',
      serializers.serialize(object.market_cap_rank,
          specifiedType: const FullType(int)),
      'total_volume',
      serializers.serialize(object.total_volume,
          specifiedType: const FullType(int)),
      'high_24h',
      serializers.serialize(object.high_24h,
          specifiedType: const FullType(double)),
      'low_24h',
      serializers.serialize(object.low_24h,
          specifiedType: const FullType(double)),
      'price_change_24h',
      serializers.serialize(object.price_change_24h,
          specifiedType: const FullType(double)),
      'price_change_percentage_24h',
      serializers.serialize(object.price_change_percentage_24h,
          specifiedType: const FullType(double)),
      'market_cap_change_24h',
      serializers.serialize(object.market_cap_change_24h,
          specifiedType: const FullType(double)),
      'market_cap_change_percentage_24h',
      serializers.serialize(object.market_cap_change_percentage_24h,
          specifiedType: const FullType(double)),
      'circulating_supply',
      serializers.serialize(object.circulating_supply,
          specifiedType: const FullType(double)),
      'ath',
      serializers.serialize(object.ath, specifiedType: const FullType(double)),
      'ath_change_percentage',
      serializers.serialize(object.ath_change_percentage,
          specifiedType: const FullType(double)),
      'ath_date',
      serializers.serialize(object.ath_date,
          specifiedType: const FullType(String)),
      'atl',
      serializers.serialize(object.atl, specifiedType: const FullType(double)),
      'atl_change_percentage',
      serializers.serialize(object.atl_change_percentage,
          specifiedType: const FullType(double)),
      'atl_date',
      serializers.serialize(object.atl_date,
          specifiedType: const FullType(String)),
      'last_updated',
      serializers.serialize(object.last_updated,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.total_supply;
    if (value != null) {
      result
        ..add('total_supply')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max_supply;
    if (value != null) {
      result
        ..add('max_supply')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  CoinGeckoMarkets deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoinGeckoMarketsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_price':
          result.current_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'market_cap':
          result.market_cap = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'market_cap_rank':
          result.market_cap_rank = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_volume':
          result.total_volume = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'high_24h':
          result.high_24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'low_24h':
          result.low_24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'price_change_24h':
          result.price_change_24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'price_change_percentage_24h':
          result.price_change_percentage_24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'market_cap_change_24h':
          result.market_cap_change_24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'market_cap_change_percentage_24h':
          result.market_cap_change_percentage_24h = serializers.deserialize(
              value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'circulating_supply':
          result.circulating_supply = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'total_supply':
          result.total_supply = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'max_supply':
          result.max_supply = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ath':
          result.ath = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ath_change_percentage':
          result.ath_change_percentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ath_date':
          result.ath_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'atl':
          result.atl = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'atl_change_percentage':
          result.atl_change_percentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'atl_date':
          result.atl_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_updated':
          result.last_updated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CoinGeckoMarkets extends CoinGeckoMarkets {
  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final String image;
  @override
  final double current_price;
  @override
  final int market_cap;
  @override
  final int market_cap_rank;
  @override
  final int total_volume;
  @override
  final double high_24h;
  @override
  final double low_24h;
  @override
  final double price_change_24h;
  @override
  final double price_change_percentage_24h;
  @override
  final double market_cap_change_24h;
  @override
  final double market_cap_change_percentage_24h;
  @override
  final double circulating_supply;
  @override
  final double? total_supply;
  @override
  final double? max_supply;
  @override
  final double ath;
  @override
  final double ath_change_percentage;
  @override
  final String ath_date;
  @override
  final double atl;
  @override
  final double atl_change_percentage;
  @override
  final String atl_date;
  @override
  final String last_updated;

  factory _$CoinGeckoMarkets(
          [void Function(CoinGeckoMarketsBuilder)? updates]) =>
      (new CoinGeckoMarketsBuilder()..update(updates)).build();

  _$CoinGeckoMarkets._(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.current_price,
      required this.market_cap,
      required this.market_cap_rank,
      required this.total_volume,
      required this.high_24h,
      required this.low_24h,
      required this.price_change_24h,
      required this.price_change_percentage_24h,
      required this.market_cap_change_24h,
      required this.market_cap_change_percentage_24h,
      required this.circulating_supply,
      this.total_supply,
      this.max_supply,
      required this.ath,
      required this.ath_change_percentage,
      required this.ath_date,
      required this.atl,
      required this.atl_change_percentage,
      required this.atl_date,
      required this.last_updated})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'CoinGeckoMarkets', 'id');
    BuiltValueNullFieldError.checkNotNull(symbol, 'CoinGeckoMarkets', 'symbol');
    BuiltValueNullFieldError.checkNotNull(name, 'CoinGeckoMarkets', 'name');
    BuiltValueNullFieldError.checkNotNull(image, 'CoinGeckoMarkets', 'image');
    BuiltValueNullFieldError.checkNotNull(
        current_price, 'CoinGeckoMarkets', 'current_price');
    BuiltValueNullFieldError.checkNotNull(
        market_cap, 'CoinGeckoMarkets', 'market_cap');
    BuiltValueNullFieldError.checkNotNull(
        market_cap_rank, 'CoinGeckoMarkets', 'market_cap_rank');
    BuiltValueNullFieldError.checkNotNull(
        total_volume, 'CoinGeckoMarkets', 'total_volume');
    BuiltValueNullFieldError.checkNotNull(
        high_24h, 'CoinGeckoMarkets', 'high_24h');
    BuiltValueNullFieldError.checkNotNull(
        low_24h, 'CoinGeckoMarkets', 'low_24h');
    BuiltValueNullFieldError.checkNotNull(
        price_change_24h, 'CoinGeckoMarkets', 'price_change_24h');
    BuiltValueNullFieldError.checkNotNull(price_change_percentage_24h,
        'CoinGeckoMarkets', 'price_change_percentage_24h');
    BuiltValueNullFieldError.checkNotNull(
        market_cap_change_24h, 'CoinGeckoMarkets', 'market_cap_change_24h');
    BuiltValueNullFieldError.checkNotNull(market_cap_change_percentage_24h,
        'CoinGeckoMarkets', 'market_cap_change_percentage_24h');
    BuiltValueNullFieldError.checkNotNull(
        circulating_supply, 'CoinGeckoMarkets', 'circulating_supply');
    BuiltValueNullFieldError.checkNotNull(ath, 'CoinGeckoMarkets', 'ath');
    BuiltValueNullFieldError.checkNotNull(
        ath_change_percentage, 'CoinGeckoMarkets', 'ath_change_percentage');
    BuiltValueNullFieldError.checkNotNull(
        ath_date, 'CoinGeckoMarkets', 'ath_date');
    BuiltValueNullFieldError.checkNotNull(atl, 'CoinGeckoMarkets', 'atl');
    BuiltValueNullFieldError.checkNotNull(
        atl_change_percentage, 'CoinGeckoMarkets', 'atl_change_percentage');
    BuiltValueNullFieldError.checkNotNull(
        atl_date, 'CoinGeckoMarkets', 'atl_date');
    BuiltValueNullFieldError.checkNotNull(
        last_updated, 'CoinGeckoMarkets', 'last_updated');
  }

  @override
  CoinGeckoMarkets rebuild(void Function(CoinGeckoMarketsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoinGeckoMarketsBuilder toBuilder() =>
      new CoinGeckoMarketsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoinGeckoMarkets &&
        id == other.id &&
        symbol == other.symbol &&
        name == other.name &&
        image == other.image &&
        current_price == other.current_price &&
        market_cap == other.market_cap &&
        market_cap_rank == other.market_cap_rank &&
        total_volume == other.total_volume &&
        high_24h == other.high_24h &&
        low_24h == other.low_24h &&
        price_change_24h == other.price_change_24h &&
        price_change_percentage_24h == other.price_change_percentage_24h &&
        market_cap_change_24h == other.market_cap_change_24h &&
        market_cap_change_percentage_24h ==
            other.market_cap_change_percentage_24h &&
        circulating_supply == other.circulating_supply &&
        total_supply == other.total_supply &&
        max_supply == other.max_supply &&
        ath == other.ath &&
        ath_change_percentage == other.ath_change_percentage &&
        ath_date == other.ath_date &&
        atl == other.atl &&
        atl_change_percentage == other.atl_change_percentage &&
        atl_date == other.atl_date &&
        last_updated == other.last_updated;
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
                                                                            $jc($jc($jc($jc($jc($jc(0, id.hashCode), symbol.hashCode), name.hashCode), image.hashCode), current_price.hashCode),
                                                                                market_cap.hashCode),
                                                                            market_cap_rank.hashCode),
                                                                        total_volume.hashCode),
                                                                    high_24h.hashCode),
                                                                low_24h.hashCode),
                                                            price_change_24h.hashCode),
                                                        price_change_percentage_24h.hashCode),
                                                    market_cap_change_24h.hashCode),
                                                market_cap_change_percentage_24h.hashCode),
                                            circulating_supply.hashCode),
                                        total_supply.hashCode),
                                    max_supply.hashCode),
                                ath.hashCode),
                            ath_change_percentage.hashCode),
                        ath_date.hashCode),
                    atl.hashCode),
                atl_change_percentage.hashCode),
            atl_date.hashCode),
        last_updated.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CoinGeckoMarkets')
          ..add('id', id)
          ..add('symbol', symbol)
          ..add('name', name)
          ..add('image', image)
          ..add('current_price', current_price)
          ..add('market_cap', market_cap)
          ..add('market_cap_rank', market_cap_rank)
          ..add('total_volume', total_volume)
          ..add('high_24h', high_24h)
          ..add('low_24h', low_24h)
          ..add('price_change_24h', price_change_24h)
          ..add('price_change_percentage_24h', price_change_percentage_24h)
          ..add('market_cap_change_24h', market_cap_change_24h)
          ..add('market_cap_change_percentage_24h',
              market_cap_change_percentage_24h)
          ..add('circulating_supply', circulating_supply)
          ..add('total_supply', total_supply)
          ..add('max_supply', max_supply)
          ..add('ath', ath)
          ..add('ath_change_percentage', ath_change_percentage)
          ..add('ath_date', ath_date)
          ..add('atl', atl)
          ..add('atl_change_percentage', atl_change_percentage)
          ..add('atl_date', atl_date)
          ..add('last_updated', last_updated))
        .toString();
  }
}

class CoinGeckoMarketsBuilder
    implements Builder<CoinGeckoMarkets, CoinGeckoMarketsBuilder> {
  _$CoinGeckoMarkets? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  double? _current_price;
  double? get current_price => _$this._current_price;
  set current_price(double? current_price) =>
      _$this._current_price = current_price;

  int? _market_cap;
  int? get market_cap => _$this._market_cap;
  set market_cap(int? market_cap) => _$this._market_cap = market_cap;

  int? _market_cap_rank;
  int? get market_cap_rank => _$this._market_cap_rank;
  set market_cap_rank(int? market_cap_rank) =>
      _$this._market_cap_rank = market_cap_rank;

  int? _total_volume;
  int? get total_volume => _$this._total_volume;
  set total_volume(int? total_volume) => _$this._total_volume = total_volume;

  double? _high_24h;
  double? get high_24h => _$this._high_24h;
  set high_24h(double? high_24h) => _$this._high_24h = high_24h;

  double? _low_24h;
  double? get low_24h => _$this._low_24h;
  set low_24h(double? low_24h) => _$this._low_24h = low_24h;

  double? _price_change_24h;
  double? get price_change_24h => _$this._price_change_24h;
  set price_change_24h(double? price_change_24h) =>
      _$this._price_change_24h = price_change_24h;

  double? _price_change_percentage_24h;
  double? get price_change_percentage_24h =>
      _$this._price_change_percentage_24h;
  set price_change_percentage_24h(double? price_change_percentage_24h) =>
      _$this._price_change_percentage_24h = price_change_percentage_24h;

  double? _market_cap_change_24h;
  double? get market_cap_change_24h => _$this._market_cap_change_24h;
  set market_cap_change_24h(double? market_cap_change_24h) =>
      _$this._market_cap_change_24h = market_cap_change_24h;

  double? _market_cap_change_percentage_24h;
  double? get market_cap_change_percentage_24h =>
      _$this._market_cap_change_percentage_24h;
  set market_cap_change_percentage_24h(
          double? market_cap_change_percentage_24h) =>
      _$this._market_cap_change_percentage_24h =
          market_cap_change_percentage_24h;

  double? _circulating_supply;
  double? get circulating_supply => _$this._circulating_supply;
  set circulating_supply(double? circulating_supply) =>
      _$this._circulating_supply = circulating_supply;

  double? _total_supply;
  double? get total_supply => _$this._total_supply;
  set total_supply(double? total_supply) => _$this._total_supply = total_supply;

  double? _max_supply;
  double? get max_supply => _$this._max_supply;
  set max_supply(double? max_supply) => _$this._max_supply = max_supply;

  double? _ath;
  double? get ath => _$this._ath;
  set ath(double? ath) => _$this._ath = ath;

  double? _ath_change_percentage;
  double? get ath_change_percentage => _$this._ath_change_percentage;
  set ath_change_percentage(double? ath_change_percentage) =>
      _$this._ath_change_percentage = ath_change_percentage;

  String? _ath_date;
  String? get ath_date => _$this._ath_date;
  set ath_date(String? ath_date) => _$this._ath_date = ath_date;

  double? _atl;
  double? get atl => _$this._atl;
  set atl(double? atl) => _$this._atl = atl;

  double? _atl_change_percentage;
  double? get atl_change_percentage => _$this._atl_change_percentage;
  set atl_change_percentage(double? atl_change_percentage) =>
      _$this._atl_change_percentage = atl_change_percentage;

  String? _atl_date;
  String? get atl_date => _$this._atl_date;
  set atl_date(String? atl_date) => _$this._atl_date = atl_date;

  String? _last_updated;
  String? get last_updated => _$this._last_updated;
  set last_updated(String? last_updated) => _$this._last_updated = last_updated;

  CoinGeckoMarketsBuilder();

  CoinGeckoMarketsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _symbol = $v.symbol;
      _name = $v.name;
      _image = $v.image;
      _current_price = $v.current_price;
      _market_cap = $v.market_cap;
      _market_cap_rank = $v.market_cap_rank;
      _total_volume = $v.total_volume;
      _high_24h = $v.high_24h;
      _low_24h = $v.low_24h;
      _price_change_24h = $v.price_change_24h;
      _price_change_percentage_24h = $v.price_change_percentage_24h;
      _market_cap_change_24h = $v.market_cap_change_24h;
      _market_cap_change_percentage_24h = $v.market_cap_change_percentage_24h;
      _circulating_supply = $v.circulating_supply;
      _total_supply = $v.total_supply;
      _max_supply = $v.max_supply;
      _ath = $v.ath;
      _ath_change_percentage = $v.ath_change_percentage;
      _ath_date = $v.ath_date;
      _atl = $v.atl;
      _atl_change_percentage = $v.atl_change_percentage;
      _atl_date = $v.atl_date;
      _last_updated = $v.last_updated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoinGeckoMarkets other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoinGeckoMarkets;
  }

  @override
  void update(void Function(CoinGeckoMarketsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CoinGeckoMarkets build() {
    final _$result = _$v ??
        new _$CoinGeckoMarkets._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'CoinGeckoMarkets', 'id'),
            symbol: BuiltValueNullFieldError.checkNotNull(
                symbol, 'CoinGeckoMarkets', 'symbol'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CoinGeckoMarkets', 'name'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, 'CoinGeckoMarkets', 'image'),
            current_price: BuiltValueNullFieldError.checkNotNull(
                current_price, 'CoinGeckoMarkets', 'current_price'),
            market_cap: BuiltValueNullFieldError.checkNotNull(
                market_cap, 'CoinGeckoMarkets', 'market_cap'),
            market_cap_rank: BuiltValueNullFieldError.checkNotNull(
                market_cap_rank, 'CoinGeckoMarkets', 'market_cap_rank'),
            total_volume: BuiltValueNullFieldError.checkNotNull(
                total_volume, 'CoinGeckoMarkets', 'total_volume'),
            high_24h: BuiltValueNullFieldError.checkNotNull(
                high_24h, 'CoinGeckoMarkets', 'high_24h'),
            low_24h: BuiltValueNullFieldError.checkNotNull(low_24h, 'CoinGeckoMarkets', 'low_24h'),
            price_change_24h: BuiltValueNullFieldError.checkNotNull(price_change_24h, 'CoinGeckoMarkets', 'price_change_24h'),
            price_change_percentage_24h: BuiltValueNullFieldError.checkNotNull(price_change_percentage_24h, 'CoinGeckoMarkets', 'price_change_percentage_24h'),
            market_cap_change_24h: BuiltValueNullFieldError.checkNotNull(market_cap_change_24h, 'CoinGeckoMarkets', 'market_cap_change_24h'),
            market_cap_change_percentage_24h: BuiltValueNullFieldError.checkNotNull(market_cap_change_percentage_24h, 'CoinGeckoMarkets', 'market_cap_change_percentage_24h'),
            circulating_supply: BuiltValueNullFieldError.checkNotNull(circulating_supply, 'CoinGeckoMarkets', 'circulating_supply'),
            total_supply: total_supply,
            max_supply: max_supply,
            ath: BuiltValueNullFieldError.checkNotNull(ath, 'CoinGeckoMarkets', 'ath'),
            ath_change_percentage: BuiltValueNullFieldError.checkNotNull(ath_change_percentage, 'CoinGeckoMarkets', 'ath_change_percentage'),
            ath_date: BuiltValueNullFieldError.checkNotNull(ath_date, 'CoinGeckoMarkets', 'ath_date'),
            atl: BuiltValueNullFieldError.checkNotNull(atl, 'CoinGeckoMarkets', 'atl'),
            atl_change_percentage: BuiltValueNullFieldError.checkNotNull(atl_change_percentage, 'CoinGeckoMarkets', 'atl_change_percentage'),
            atl_date: BuiltValueNullFieldError.checkNotNull(atl_date, 'CoinGeckoMarkets', 'atl_date'),
            last_updated: BuiltValueNullFieldError.checkNotNull(last_updated, 'CoinGeckoMarkets', 'last_updated'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
