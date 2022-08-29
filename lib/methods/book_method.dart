import 'dart:convert';
import 'package:http/http.dart';
import '../models/books_model.dart';

class BooksMethod {
  List<CollectionBooks> data = [];

  Future<List<CollectionBooks>> getCollectinBooks(String bkName) async {
    var url = Uri.parse("https://api.sunnah.com/v1/collections/$bkName/books");
    var response = await get(url,
        headers: {"X-API-Key": "SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk"});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List<dynamic> body = jsonResponse['data'];

      data = body.map((e) => CollectionBooks.fromJson(e)).toList();
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return data;
  }
}
