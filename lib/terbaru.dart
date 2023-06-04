import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail.dart';

class Terbaru extends StatefulWidget {
  const Terbaru({Key? key}) : super(key: key);

  @override
  State<Terbaru> createState() => _TerbaruState();
}

class _TerbaruState extends State<Terbaru> {
  List<dynamic> newsLists = [];
  List<dynamic> filteredNewsLists = [];

  Future<void> fetchNewsData() async {
    final response = await http
        .get(Uri.parse('https://api-berita-indonesia.vercel.app/cnn/terbaru'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        newsLists = data['data']['posts'];
        filteredNewsLists = newsLists;
      });
    }
  }

  @override
  void initState() {
    fetchNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CNN TERBARU'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: filteredNewsLists.length,
        itemBuilder: (context, index) {
          final news = filteredNewsLists[index];
          return Container(
            height: 100, // Tinggi list item
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey[200]!, width: 1.0),
              ),
              child: InkWell(
                onTap: () {
                  // Handle news item tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detail(news: news),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150, // Lebar gambar
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          news['thumbnail'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
