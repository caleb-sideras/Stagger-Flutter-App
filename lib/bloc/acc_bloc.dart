import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stagger_v3/rest/binance_rest.dart';

class AccountBloc {
  Stream<List> get accountData => _accountDataSubject.stream;
  final _accountDataSubject = BehaviorSubject<List>();

  Stream<String> get accountBalance => _accountBalanceSubject.stream;
  final _accountBalanceSubject = BehaviorSubject<String>();

  Stream<List<List<String>>> get getAlgoInfo => _getAlgoInfoSubject.stream;
  final _getAlgoInfoSubject = BehaviorSubject<List<List<String>>>();

  Sink<List<String>> get setAlgoInfo => _setAlgoInfoController.sink;
  final _setAlgoInfoController = StreamController<List<String>>();

  Sink<String> get setSymbolPrice => _setSymbolPriceController.sink;
  final _setSymbolPriceController = StreamController<String>();

  Stream<String> get getSymbolPrice => _getSymbolPriceSubject.stream;
  final _getSymbolPriceSubject = BehaviorSubject<String>();

  Sink<String> get setCryptoAmount => _setCryptoAmountController.sink;
  final _setCryptoAmountController = StreamController<String>();

  List _accountCrypto = [];
  var _algoinfo = <List<String>>[
    [
      'LINK',
      '1',
      '2',
      'current',
      '0xFFE54C38',
      'Inactive',
      'SELL',
      '1 LINK value: 18.7254',
      '1 LINK (sold): 18.7254 + 0.02',
      'BUY',
      '1 LINK value: 17.8635',
      '17.8635 USDT (bought): 1LINKUSDT'
    ]
  ];
  var _accountBalance;
  var _binance = BinanceRest();
  String cryptoAmount = '1';
  String cryptoPrice = '0';

  AccountBloc() {
    _initializeAccount().then((_) {
      _accountDataSubject.add(_accountCrypto);
      _accountBalanceSubject.add(_accountBalance);
    });
    _getAlgoInfoSubject.add(_algoinfo);

    _setAlgoInfoController.stream.listen(_handle);

    _setSymbolPriceController.stream.listen(_handle2);

    _setCryptoAmountController.stream.listen(_handle3);
  }

  Future<void> _initializeAccount() async {
    await _binance.getPortfolio().then((_) {
      _accountCrypto = _binance.getTotalPortfolio();
      _accountBalance = _binance.getTotalBalance();
    });
  }

  Future<void> _handle(List<String> crypto) async {
    _algoinfo.add(crypto);
    _getAlgoInfoSubject.add(_algoinfo);
  }

  Future<void> _handle2(String crypto) async {
    await _binance.getSymbolPrice(crypto).then((value) {
      cryptoPrice = value['price'];
      var temp = double.parse(cryptoAmount) * double.parse(value['price']);
      var tempFees = temp * 0.001;
      _getSymbolPriceSubject
          .add('${temp.toStringAsFixed(2)} + ${tempFees.toStringAsFixed(2)}');
    });
  }

  Future<void> _handle3(String amount) async {
    cryptoAmount = amount.toString();
    var temp = double.parse(cryptoAmount) * double.parse(cryptoPrice);
    var tempFees = temp * 0.001;
    _getSymbolPriceSubject
        .add('${temp.toStringAsFixed(2)} + ${tempFees.toStringAsFixed(2)}');
  }

  getAccountCrypto() {
    List<String> temp = [];
    for (var item in _accountCrypto) {
      temp.add(item['asset']);
    }
    return temp;
  }
}
