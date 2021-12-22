import 'dart:convert';
import 'package:bytebankk/models/transaction.dart';
import 'package:http/http.dart';
import '../webclient.dart';
import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) {
      return Transaction.fromJson(json);
    }).toList();
  }

  Future<Transaction> save(
    Transaction transaction,
    String password,
  ) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2));

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
    
    //_throwHttpError(response.statusCode);
  }

  String? _getMessage(int statusCode) {
    if(_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';
  } 

/*
  void _throwHttpError(int statusCode) {
    throw Exception(_statusCodeResponses[statusCode]);
  }
*/
  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed',
    409: 'Transsaction always exists'
  };
}

class HttpException implements Exception {
  final dynamic message;

  HttpException([this.message]);
}
