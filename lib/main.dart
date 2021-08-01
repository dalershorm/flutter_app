import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading = false;
  double _proccessValue = 0.0;

  @override
  void initState() {
    _loading = false;
    _proccessValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 255),
        appBar: AppBar(
          title: Text("App Bar"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                        value: _proccessValue,
                      ),
                      Text(
                        "${(_proccessValue * 100).round()} %",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )
                : Text(
                    "Press button to download",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _upddateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _upddateProgress() {
    const oneSec = const Duration(seconds: 1);

    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _proccessValue += 0.2;
        if (_proccessValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _proccessValue = 0.0;
          return;
        }
      });
    });
  }
}
