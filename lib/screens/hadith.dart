import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadees/methods/hadith_content_method.dart';
import 'package:hadees/screens/books.dart';

class HadithScren extends StatelessWidget {
  const HadithScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Name"),
        centerTitle: true,
      ),
      body: const HadithCard(),
    );
  }
}

class HadithCard extends StatefulWidget {
  const HadithCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  Color hadisTitle = Colors.green;

  final _scrollControllerBar = ScrollController();

  HadithContentMethod hadithContentMethod = HadithContentMethod();

  @override
  void dispose() {
    super.dispose();
    _scrollControllerBar.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> book =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Column(children: [
      Expanded(
        child: FutureBuilder(
            future: hadithContentMethod.getHadith(
                book['bookName'], book['bookNumber']),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("NO DATA");
              } else {
                return ListView.builder(
                  controller: _scrollControllerBar,
                  itemCount: hadithContentMethod.data.length,
                  itemBuilder: (context, index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 04, vertical: 03),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.blueAccent,
                        )),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      fontSize: 16, color: hadisTitle),
                                  text: "Hadith Number:- "),
                              TextSpan(
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                text: hadithContentMethod.data[index]
                                    .toJson()['hadith'][0]['chapterNumber']
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                        kDividerOfSurahInfo,
                        Text("Title of Hadith: ",
                            style: TextStyle(fontSize: 16, color: hadisTitle)),
                        Text(
                            hadithContentMethod.data[index].toJson()['hadith']
                                [0]['chapterTitle'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        kSizedBoxOfSurahInfo,
                        Text("Content of Hadith",
                            style: TextStyle(fontSize: 16, color: hadisTitle)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: Scrollbar(
                            thumbVisibility: true,
                            controller: _scrollControllerBar,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Html(
                                data: hadithContentMethod.data[index]
                                    .toJson()['hadith'][0]['body'],
                                style: {
                                  "body": Style(
                                      color: Colors.white,
                                      fontSize: const FontSize(18),
                                      fontWeight: FontWeight.w400)
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      )
    ]);
  }
}
