import 'dart:convert';

import 'package:hadees/models/books_model.dart';
import 'package:hadees/models/colletion_model.dart';
import 'package:hadees/models/hadith_model.dart';
import 'package:http/http.dart';

Future<void> getData() async {
  List<CollectionData> data = [];

  var url = Uri.parse("https://api.sunnah.com/v1/collections?limit=50&page=1");
  var response = await get(url,
      headers: {"X-API-Key": "SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk"});

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    List<dynamic> body = jsonResponse['data'];

    for (var i = 0; i < body.length; i++) {
      if (body[i]['name'] == "bukhari" ||
          body[i]['name'] == 'muslim' ||
          body[i]['name'] == 'abudawud' ||
          body[i]['name'] == 'tirmidhi') {
        data.add(CollectionData.fromJson(body[i]));
      }
    }

    print(data.length);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  // it will give all collection containing all the tiridhi,muslim etc
}

Future<void> getCollectinBooks() async {
  List<CollectionBooks> data = [];

  String bookName = "tirmidhi";
  var url = Uri.parse("https://api.sunnah.com/v1/collections/$bookName/books");
  var response = await get(url,
      headers: {"X-API-Key": "SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk"});

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    List<dynamic> body = jsonResponse['data'];

    data = body.map((e) => CollectionBooks.fromJson(e)).toList();

    print(data[0].toJson()['book'][0]['name']);
    // return data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  // return data;
}

Future<void> getHadith() async {
  List<HadithData> data = [];

  String bookName = "tirmidhi";
  int bookNo = 1;
  var url = Uri.parse(
      "https://api.sunnah.com/v1/collections/$bookName/books/$bookNo/hadiths");
  var response = await get(url,
      headers: {"X-API-Key": "SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk"});

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    List<dynamic> body = jsonResponse['data'];

    data = body.map((e) => HadithData.fromJson(e)).toList();

    print(data[0].toJson());
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void main() {
  getHadith();
}
