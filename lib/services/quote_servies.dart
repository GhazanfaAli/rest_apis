import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:shimmer/shimmer.dart'; // Import the HTML parser

class QuotesServices extends StatelessWidget {
  var data = [];
  QuotesServices({super.key});

  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse('https://quotesondesign.com/wp-json/wp/v2/posts/?orderby=rand'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      // Handle error
      throw Exception('Failed to load quotes');
    }
  }

  String removeHtmlTags(String htmlString) {
    final document = htmlParser.parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.builder(
                      itemCount: 10, // Placeholder for shimmer effect
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 5,
                              child: Column(
                                children: [
                                  Container(height: 20, color: Colors.white),
                                  SizedBox(height: 10),
                                  Container(height: 20, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: Column(
                              children: [
                                ReusableRow(title: 'Author:', value: removeHtmlTags(data[index]['title']['rendered'].toString())),
                                Divider(thickness: 1, color: Colors.grey[400]),
                                ReusableRow(title: 'Quote:', value: removeHtmlTags(data[index]['content']['rendered'].toString())),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No Data Available'));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  ReusableRow({super.key, required this.title, required this.value});

  // => max 7 words at each line
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          Expanded(
            flex: 3,
            child: Text(splitTextIntoLines(value, 7), style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
          ),
        ],
      ),
    );
  }
}
