import 'dart:convert';

import 'package:hadees/models/colletion_model.dart';
import 'package:http/http.dart';

class CollectionOfHadiths {
  final List<CollectionData> _collectionData = [];

  List<CollectionData> get collectionData {
    return _collectionData;
  }

  Future<List<CollectionData>> getCollection() async {
    var url =
        Uri.parse("https://api.sunnah.com/v1/collections?limit=50&page=1");
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
          _collectionData.add(CollectionData.fromJson(body[i]));
        }
      }

      return _collectionData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _collectionData;
  }
}
