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
  final inputContDetail = TextEditingController();
  String _inputJudul;
  String _inputDetail;

  List<String> listViewJudul = <String>[];
  List<String> listViewDetail = <String>[];

  void memasukkanData() {
    //Untuk Memasukkan Data Ke List
    setState(() {
      _inputDetail = inputContDetail.text;
      _inputJudul = inputContJudul.text;
      listViewJudul.add("$_inputJudul");
      listViewDetail.add("$_inputDetail");
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
                //Text Form Field Untuk Mengisi Judul To-do List
                controller: inputContJudul,
                decoration: InputDecoration(labelText: 'Masukkan To-Do List'),
              ),
              TextFormField(
                //Text Form Field Untuk Mengisi Detail To-do List
                controller: inputContDetail,
                decoration: InputDecoration(labelText: 'Detail To-Do List'),
              ),
              ElevatedButton(
                //Button Untuk Menambahkan Data Ke List
                child: Text('Insert'),
                onPressed: memasukkanData,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listViewJudul.length,
                  itemBuilder: (context, index) {
                    final item = listViewJudul[index];
                    final itemDetail = listViewDetail[index];
                    return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: UniqueKey(),
                      // Key(item[index]),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          listViewJudul.removeAt(index);
                          listViewDetail.removeAt(index);
                        });

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$item Dihapus")));
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(color: Colors.blue),
                      child: ListTile(
                        //Menampilkan List
                        title: Text('$item'),
                        subtitle: Text('$itemDetail'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
