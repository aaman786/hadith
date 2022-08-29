class HadithData {
  List<Hadith>? hadith;

  HadithData({this.hadith});

  HadithData.fromJson(Map<String, dynamic> json) {
    if (json['hadith'] != null) {
      hadith = <Hadith>[];
      hadith!.add(Hadith.fromJson(json['hadith'][0]));

      // json['hadith'].forEach((v) {
      //   hadith!.add(Hadith.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hadith != null) {
      data['hadith'] = hadith!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadith {
  String? chapterNumber;
  String? chapterTitle;
  String? body;

  Hadith({this.chapterNumber, this.chapterTitle, this.body});

  Hadith.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapterNumber'];
    chapterTitle = json['chapterTitle'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['chapterNumber'] = chapterNumber;
    data['chapterTitle'] = chapterTitle;

    data['body'] = body;

    return data;
  }
}
