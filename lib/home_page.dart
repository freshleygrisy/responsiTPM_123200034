import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsi_123200034/olahraga.dart';
import 'package:responsi_123200034/terbaru.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png'),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (Olahraga()),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      "OLAHRAGA",
                      style: TextStyle(color: Colors.white),
                    ))),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Terbaru()),
                    ),
                  );
                },
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: Text("TERBARU"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
