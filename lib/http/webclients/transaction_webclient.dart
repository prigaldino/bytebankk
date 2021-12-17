import 'dart:convert';
import 'package:bytebankk/models/transaction.dart';
import 'package:http/http.dart';
import '../webclient.dart';

class TransactionWebClient {
  
  Future<List<Transaction>> findAll() async {
    var url = 'http://192.168.15.139:8080/transactions';
    final Response response = await client.get(Uri.parse(url)).timeout(
          Duration(seconds: 5),
        );
          final List<dynamic> decodedJson = jsonDecode(response.body); 
      return decodedJson.map((dynamic json) {
        return Transaction.fromJson(json);
      }).toList();
  }

  Future<Transaction> save(Transaction transaction) async {  
    final String transactionJson = jsonEncode(transaction.toJson());

    var url = 'http://192.168.15.139:8080/transactions';
    final Response response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

}