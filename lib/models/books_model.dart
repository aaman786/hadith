class CollectionBooks {
  String? bookNumber;
  List<Book>? book;
  int? hadithStartNumber;
  int? hadithEndNumber;
  int? numberOfHadith;

  CollectionBooks(
      {this.bookNumber,
      this.book,
      this.hadithStartNumber,
      this.hadithEndNumber,
      this.numberOfHadith});

  CollectionBooks.fromJson(Map<String, dynamic> json) {
    bookNumber = json['bookNumber'];
    if (json['book'] != null) {
      book = <Book>[];
      json['book'].forEach((v) {
        book!.add(Book.fromJson(v));
      });
    }
    hadithStartNumber = json['hadithStartNumber'];
    hadithEndNumber = json['hadithEndNumber'];
    numberOfHadith = json['numberOfHadith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookNumber'] = bookNumber;
    if (book != null) {
      data['book'] = book!.map((v) => v.toJson()).toList();
    }
    data['hadithStartNumber'] = hadithStartNumber;
    data['hadithEndNumber'] = hadithEndNumber;
    data['numberOfHadith'] = numberOfHadith;
    return data;
  }
}

class Book {
  String? lang;
  String? name;

  Book({this.lang, this.name});

  Book.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lang'] = lang;
    data['name'] = name;
    return data;
  }
}
