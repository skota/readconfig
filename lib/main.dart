import 'package:flutter/material.dart';
import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart' show DefaultAssetBundle;

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String configData;

  Future<String> loadAsset() async {
    //return await rootBundle.loadString('assets/test.json');
    return await DefaultAssetBundle.of(context).loadString('assets/test.json');
  }

  @override
  void initState() {
    loadAsset().then((data) {
      Map decodedData = jsonDecode(data);
      setState(() {
        configData = decodedData['api_key'];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(configData);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Api key",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$configData"),
            ],
          ),
        ),
      ),
    );
  }
}
