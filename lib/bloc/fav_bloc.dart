import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class FavBloc {
  Sink<List<String>> get addFavorite => _addFavoriteController.sink;
  final _addFavoriteController = StreamController<List<String>>();

  Stream<List<List<String>>> get getFavorites => _getFavoritesSubject.stream;
  final _getFavoritesSubject = BehaviorSubject<List<List<String>>>();

  var _favCrypto = [
    ['bitcoin', 'BTC'],
    ['ethereum', 'ETH'],
    ['cardano', 'ADA'],
    ['dogecoin', 'DOGE'],
    ['polkadot', 'DOT'],
    ['chainlink', 'LINK'],
    ['solana', 'SOL'],
    ['algorand', 'ALGO']
  ];
  // var _favCrypto = <List<String>>[];

  FavBloc() {
    _addFavoriteController.stream.listen(_handle);

    _getFavoritesSubject.add(_favCrypto);
  }

  void _handle(List<String> crypto) {
    _updateFavorites(crypto).then((_) {
      _getFavoritesSubject.add(_favCrypto);
    });
  }

  Future<void> _updateFavorites(List<String> crypto) async {
    for (var i = 0; i < _favCrypto.length; i++) {
        if (_favCrypto.isNotEmpty && listEquals(_favCrypto[i], crypto)) {
          _favCrypto.removeAt(i);
          return;
        }
    }
    _favCrypto.add(crypto);
  }
}

class favClass {
  String? name;
  String? symbol;
}
