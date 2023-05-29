import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(Olahraga());
}

class Olahraga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olahraga',
      home: OlahragaList(Olahraga: 'Olahraga'),
    );
  }
}

class OlahragaList extends StatefulWidget {
  final String Olahraga;

  OlahragaList({required this.Olahraga});

  @override
  _OlahragaListState createState() => _OlahragaListState();
}

class _OlahragaListState extends State<OlahragaList> {
  List<String> olahraga = [];

  @override
  void initState() {
    super.initState();
    fetchOlahraga();
  }

  Future<void> fetchOlahraga() async {
    String apiUrl = 'https://api-berita-indonesia.vercel.app/cnn/olahraga';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Response Body: $data');
        setState(() {
          olahraga = List<String>.from(data);
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
        title: Text(widget.Olahraga),
      ),
      body: ListView.builder(
        itemCount: olahraga.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(olahraga[index]),
          );
        },
      ),
    );
  }
}
