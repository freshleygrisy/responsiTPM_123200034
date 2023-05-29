import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(Terbaru());
}

class Terbaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terbaru',
      home: TerbaruList(Terbaru: 'Terbaru'),
    );
  }
}

class TerbaruList extends StatefulWidget {
  final String Terbaru;

  TerbaruList({required this.Terbaru});

  @override
  _TerbaruListState createState() => _TerbaruListState();
}

class _TerbaruListState extends State<TerbaruList> {
  List<String> terbaru = [];

  @override
  void initState() {
    super.initState();
    fetchTerbaru();
  }

  Future<void> fetchTerbaru() async {
    String apiUrl = 'https://api-berita-indonesia.vercel.app/cnn/terbaru';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Response Body: $data');
        setState(() {
          terbaru = List<String>.from(data);
        });
      } else {
        print('Failed to load character list. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Terbaru),
      ),
      body: ListView.builder(
        itemCount: terbaru.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(terbaru[index]),
          );
        },
      ),
    );
  }
}
