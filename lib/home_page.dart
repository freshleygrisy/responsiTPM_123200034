import 'package:flutter/material.dart';
import 'package:responsi_123200034/olahraga.dart';
import 'package:responsi_123200034/terbaru.dart';
import 'package:responsi_123200034/nasional.dart';
import 'package:responsi_123200034/teknologi.dart';

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
  return Column(
    children: [
      const Padding(padding: EdgeInsets.all(20)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Terbaru()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'TERBARU',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nasional()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'NASIONAL',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Olahraga()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'OLAHRAGA',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Teknologi()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'TEKNOLOGI',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    ],
  );
}
