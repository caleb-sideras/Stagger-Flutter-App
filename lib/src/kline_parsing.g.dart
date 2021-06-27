// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline_parsing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BinanceKline> _$binanceKlineSerializer =
    new _$BinanceKlineSerializer();

class _$BinanceKlineSerializer implements StructuredSerializer<BinanceKline> {
  @override
  final Iterable<Type> types = const [BinanceKline, _$BinanceKline];
  @override
  final String wireName = 'BinanceKline';

  @override
  Iterable<Object?> serialize(Serializers serializers, BinanceKline object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'kline',
      serializers.serialize(object.kline,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Kline)])),
    ];

    return result;
  }

  @override
  BinanceKline deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BinanceKlineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'kline':
          result.kline.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Kline)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BinanceKline extends BinanceKline {
  @override
  final BuiltList<Kline> kline;

  factory _$BinanceKline([void Function(BinanceKlineBuilder)? updates]) =>
      (new BinanceKlineBuilder()..update(updates)).build();

  _$BinanceKline._({required this.kline}) : super._() {
    BuiltValueNullFieldError.checkNotNull(kline, 'BinanceKline', 'kline');
  }

  @override
  BinanceKline rebuild(void Function(BinanceKlineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BinanceKlineBuilder toBuilder() => new BinanceKlineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BinanceKline && kline == other.kline;
  }

  @override
  int get hashCode {
    return $jf($jc(0, kline.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BinanceKline')..add('kline', kline))
        .toString();
  }
}

class BinanceKlineBuilder
    implements Builder<BinanceKline, BinanceKlineBuilder> {
  _$BinanceKline? _$v;

  ListBuilder<Kline>? _kline;
  ListBuilder<Kline> get kline => _$this._kline ??= new ListBuilder<Kline>();
  set kline(ListBuilder<Kline>? kline) => _$this._kline = kline;

  BinanceKlineBuilder();

  BinanceKlineBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kline = $v.kline.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BinanceKline other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BinanceKline;
  }

  @override
  void update(void Function(BinanceKlineBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BinanceKline build() {
    _$BinanceKline _$result;
    try {
      _$result = _$v ?? new _$BinanceKline._(kline: kline.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'kline';
        kline.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BinanceKline', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
