class CollectionData {
  String? name;
  List<Collection>? collection;
  int? totalHadith;
  int? totalAvailableHadith;

  CollectionData(
      {this.name,
      this.collection,
      this.totalHadith,
      this.totalAvailableHadith});

  CollectionData.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(Collection.fromJson(v));
      });
    }
    totalHadith = json['totalHadith'];
    totalAvailableHadith = json['totalAvailableHadith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;

    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    data['totalHadith'] = totalHadith;
    data['totalAvailableHadith'] = totalAvailableHadith;
    return data;
  }
}

class Collection {
  String? title;
  String? shortIntro;

  Collection({this.title, this.shortIntro});

  Collection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortIntro = json['shortIntro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['shortIntro'] = shortIntro;
    return data;
  }
}
