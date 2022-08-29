import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:hadees/methods/collection_mthod.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color surahInfoTitle = Colors.green;

    CollectionOfHadiths collectionOfHadiths = CollectionOfHadiths();

    return Scaffold(
      appBar: AppBar(title: const Text("Collection Of Reference Books")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: collectionOfHadiths.getCollection(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("No Data");
                  } else {
                    return ListView.builder(
                      itemCount: collectionOfHadiths.collectionData.length,
                      itemBuilder: (context, index) => InkWell(
                        splashColor: Colors.white38,
                        onTap: () {
                          Navigator.pushNamed(context, 'books',
                              arguments: collectionOfHadiths
                                  .collectionData[index]
                                  .toJson());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(08),
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black38.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.blueAccent,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  collectionOfHadiths.collectionData[index]
                                      .toJson()['collection'][0]['title'],
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              kDividerOfSurahInfo,
                              const Text("Description",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green)),
                              Html(
                                  data: collectionOfHadiths
                                      .collectionData[index]
                                      .toJson()['collection'][0]['shortIntro']),
                              kDividerOfSurahInfo,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: surahInfoTitle),
                                            text: "Total number of Hadith: "),
                                        TextSpan(
                                            style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            text: collectionOfHadiths
                                                .collectionData[index]
                                                .toJson()['totalHadith']
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              kSizedBoxOfSurahInfo,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: surahInfoTitle),
                                            text: "Available Hadith: "),
                                        TextSpan(
                                            style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            text: collectionOfHadiths
                                                .collectionData[index]
                                                .toJson()[
                                                    'totalAvailableHadith']
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ),
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
