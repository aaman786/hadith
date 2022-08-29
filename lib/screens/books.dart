import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadees/methods/book_method.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color surahInfoTitle = Colors.green;

    BooksMethod booksMethod = BooksMethod();

    final Map<String, dynamic> collection =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(collection['collection'][0]['title'])),
      body: Column(
        children: [
          FutureBuilder(
              future: booksMethod.getCollectinBooks(collection['name']),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("NO DATA");
                } else {
                  return Expanded(
                    child: GridView.builder(
                        itemCount: booksMethod.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'hadith',
                                  arguments: {
                                    'bookName': collection['name'],
                                    'bookNumber': booksMethod.data[index]
                                        .toJson()['bookNumber']
                                  });
                            },
                            splashColor: Colors.white30,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(
                                  top: 3, bottom: 3, left: 4, right: 4),
                              decoration: BoxDecoration(
                                  color: Colors.black38.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: surahInfoTitle),
                                            text: "Book No. "),
                                        TextSpan(
                                            style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            text: booksMethod.data[index]
                                                .toJson()['bookNumber']),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 03),
                                  Text(
                                      booksMethod.data[index].toJson()['book']
                                          [0]['name'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  const Divider(
                                    thickness: 1.5,
                                    height: 30,
                                    color: Colors.white30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: surahInfoTitle),
                                                text: "Hadith Start No. "),
                                            TextSpan(
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                text: booksMethod.data[index]
                                                    .toJson()[
                                                        'hadithStartNumber']
                                                    .toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: surahInfoTitle),
                                                text: "Hadith End No. "),
                                            TextSpan(
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                text: booksMethod.data[index]
                                                    .toJson()['hadithEndNumber']
                                                    .toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}

const kDividerOfSurahInfo = Divider(
  color: Colors.white10,
  height: 15,
);
const kSizedBoxOfSurahInfo = SizedBox(
  height: 6,
);
