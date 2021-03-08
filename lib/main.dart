import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputContJudul = TextEditingController();
  final inputContIsi = TextEditingController();
  String _inputIsi;

  List<String> listViewIsi = <String>[];

  void memasukkanData() {
    setState(() {
      _inputIsi = inputContIsi.text;
      listViewIsi.add("$_inputIsi");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: inputContIsi,
                decoration:
                    InputDecoration(labelText: 'Masukkan To-Do List Isi'),
              ),
              RaisedButton(
                child: Text('Masukkan'),
                color: Colors.blue,
                onPressed: memasukkanData,
              ),
              Expanded(
                child: ListView(
                    children: listViewIsi.map((String value) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ));
                }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
