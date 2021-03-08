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
  String _inputJudul;
  String _inputIsi;

  List<String> listViewJudul = <String>["Data1"];
  List<String> listViewIsi = <String>[];

  void memasukkanData() {
    setState(() {
      _inputJudul = inputContJudul.text;
      _inputIsi = inputContIsi.text;
      listViewJudul.add("$_inputJudul");
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
                controller: inputContJudul,
                decoration:
                    InputDecoration(labelText: 'Masukkan Suhu Dalam Celcius'),
              ),
              TextFormField(
                controller: inputContIsi,
                decoration: InputDecoration(labelText: 'Isi'),
              ),
              RaisedButton(
                child: Text('Masukkan'),
                color: Colors.blue,
                onPressed: memasukkanData,
              ),
              Expanded(
                child: ListView(
                    children: listViewJudul.map((String value) {
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
