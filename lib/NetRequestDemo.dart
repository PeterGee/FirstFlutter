import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void getHttp() async{
  try{
    Response response = await Dio().get("http://www.baidu.com");
    print(response);
  }catch(e){
    print(e);
  }
}

Future<void> getMethodWithParam() async {
  Response mResponse;
  mResponse = await Dio().get("/test?id = 3&name = zhangsan");
  print(mResponse);
}

Future<void> postHttp() async {
  Response response = await Dio().post("/test",data: {"id":3,"name":"liuwangshu"});
  print(response);
}


class Ip{
  String origin;
  Ip(this.origin);

  Ip.fromJson(Map<String,dynamic> json):origin = json["origin"];

  Map<String,dynamic> toJson() =>{
    "origin":origin
  };
}

class MyNetApp extends StatelessWidget{
  const MyNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NetRequestClass(),
    );
  }

}

class NetRequestClass extends StatefulWidget{
   const NetRequestClass({super.key});

  @override
  _MyHomePageState createState() =>_MyHomePageState();

}

class _MyHomePageState extends State<NetRequestClass>{
  var _ipAddress= "Unknown";

  _getIpAddress() async {
    var url = "https://httpbin.org/ip";
    Dio dio = Dio();
    String result;

    try{
      var response = await dio.get(url);
      if(response.statusCode == HttpStatus.ok){
        var data = jsonDecode(response.toString());
        var ip = Ip.fromJson(data);
       // result = data['origin'];
        result = ip.origin;
      }else{
        result = 'Error getting IP status ${response.statusCode}';
      }
    }catch(e){
        result = e.toString();
    }

    if(!mounted) return;
    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = const SizedBox(height: 10.0,);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: <Widget>[
            const Text('Ip地址为：'),
            spacer,
            Text(_ipAddress),
            spacer,
            MaterialButton(
              onPressed: _getIpAddress,
              child: const Text("请求网络"),
            )
          ],
        ),
      ),
    );
  }

}