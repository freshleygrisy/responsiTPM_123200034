import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class detail extends StatelessWidget {
  final dynamic news;

  detail({required this.news});

  String formatDate(String dateString) {
    final parsedDate = DateTime.parse(dateString);
    final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = formatDate(news['pubDate']);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CNN News'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              news['title'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '$formattedDate',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: FittedBox(
                fit: BoxFit.scaleDown, // Menyesuaikan gambar dengan kotak
                child: Image.network(
                  news['thumbnail'],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              news['description'],
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'Baca Selengkapnya...',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
