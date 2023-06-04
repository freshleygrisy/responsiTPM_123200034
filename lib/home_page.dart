import 'package:flutter/material.dart';
import 'package:responsi_123200034/olahraga.dart';
import 'package:responsi_123200034/terbaru.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  cnnImage(),
                  rowButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cnnImage() {
  return Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 70)),
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png',
          width: 250,
          height: 250,
        ),
      ),
    ],
  );
}

Widget rowButton(BuildContext context) {
  return Column (
    children: [
      const Padding(padding: EdgeInsets.all(20)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Terbaru()),
                );
              },
              child: Text('TERBARU')),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Olahraga()),
                );
              },
              child: Text('NASIONAL')),
        ],
      ),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Olahraga()),
              );
            },
            child: Text('OLAHRAGA'),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Terbaru()),
                );
              },
              child: Text('TEKNOLOGI')),
        ],
      ),
    ],
  );
}
