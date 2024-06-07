import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class ArbicHolyQuran extends StatefulWidget {
  ArbicHolyQuran({super.key});

  @override
  _ArbicHolyQuranState createState() => _ArbicHolyQuranState();
}

class _ArbicHolyQuranState extends State<ArbicHolyQuran> {
  TextEditingController _controller = TextEditingController();
  var data;

  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani'));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body)['data']['surahs'];
      });
    } else {
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holy Quran', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade200, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: data == null
                    ?

                ListView.builder(
                  itemCount: 6, // Number of shimmer items
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.black12,
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20.0,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 18.0,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Divider(thickness: 1, color: Colors.grey[400]),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(3, (ayahIndex) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 14.0,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width: double.infinity,
                                        height: 14.0,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var surah = data[index];
                    String name = surah['englishName'];
                    if (_controller.text.isEmpty || name.toLowerCase().contains(_controller.text.toLowerCase())) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                surah['englishName'],
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Translation: ${surah['englishNameTranslation']}',
                                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                              ),
                              Divider(thickness: 1, color: Colors.grey[400]),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: surah['ayahs'].length,
                                itemBuilder: (context, ayahIndex) {
                                  var ayah = surah['ayahs'][ayahIndex];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableRow(
                                        title: 'Ayah ${ayah['numberInSurah']}:',
                                        value: ayah['text'],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[300]!),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('Page: ${ayah['page']}', style: TextStyle(color: Colors.teal, fontSize: 9)),
                                            SizedBox(width: 10),
                                            Text('Manzil: ${ayah['manzil']}', style: TextStyle(color: Colors.teal, fontSize: 9)),
                                            SizedBox(width: 10),
                                            Text('Juz: ${ayah['juz']}', style: TextStyle(color: Colors.teal, fontSize: 9)),
                                            SizedBox(width: 10),
                                            Text('Ruku: ${ayah['ruku']}', style: TextStyle(color: Colors.teal, fontSize: 9)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  ReusableRow({super.key, required this.title, required this.value});

  // maximum 7 words at each line
  String splitTextIntoLines(String text, int wordsPerLine) {
    List<String> words = text.split(' ');
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < words.length; i++) {
      buffer.write(words[i]);
      if ((i + 1) % wordsPerLine == 0 && i != words.length - 1) {
        buffer.write('\n');
      } else {
        buffer.write(' ');
      }
    }
    return buffer.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              splitTextIntoLines(value, 7),
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
