import 'dart:convert';
import 'package:http/http.dart';
import '../models/hadith_model.dart';

class HadithContentMethod {
  List<HadithData> data = [];

  Future<List<HadithData>> getHadith(String bkName, String bkNo) async {
    // String bookName = "tirmidhi";
    int bookNoInt = int.parse(bkNo);
    // print("Book anme $bkName and no: ${bkNo.toString()}");
    var url = Uri.parse(
        "https://api.sunnah.com/v1/collections/$bkName/books/$bookNoInt/hadiths");
    var response = await get(url,
        headers: {"X-API-Key": "SqD712P3E82xnwOAEOkGd5JZH8s9wRR24TqNFzjk"});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List<dynamic> body = jsonResponse['data'];

      data = body.map((e) => HadithData.fromJson(e)).toList();

      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return data;
  }
}
