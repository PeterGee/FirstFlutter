import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class FlutterIntentApp extends StatelessWidget{
  const FlutterIntentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample Shared App Handler",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: const IntentAppPage(),
    );
  }

}

class IntentAppPage extends StatefulWidget{
  const IntentAppPage({super.key});

  @override
  State<IntentAppPage> createState() => _IntentAppPageState();

}

class _IntentAppPageState extends State<IntentAppPage>{
  static const platform = MethodChannel('app.channel.share.data');
  String dataShared = 'No data';
  List widgets = [];

  @override
  void initState() {
    super.initState();
    getNetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("getNetData"),
     ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder:(context,position){
            return getRow(position);
          }

      ),
    );
  }

  Future<void> getSharedText() async{
    var sharedData = await platform.invokeMethod('getSharedTest');
    if(sharedData!=null){
      setState(() {
        dataShared = sharedData;
      });
    }
  }

  Future<void> getNetData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }

  Widget getRow(int position) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text("Row ${widgets[position]["title"]}"),
    );

  }

}