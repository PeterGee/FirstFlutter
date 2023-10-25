import 'package:flutter/material.dart';
import 'dart:convert' show json;

class AssetsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("加载文本示例"),
        ),
        body:ImageWidget(),
      ),
    );
  }
}
class JsonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JsonWidgetState();
  }
}
class _JsonWidgetState extends State<JsonWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(//1
      future: DefaultAssetBundle.of(context).loadString("assets/swordsmen.json"),//2
      builder: (context, snapshot) {
        if (!snapshot.hasData) {//3
          return  Center(
            child: CircularProgressIndicator(),
          );
        }else{
          List<dynamic> data = json.decode(snapshot.data.toString());//4
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("名字: ${data[index]["name"]}"),
                    Text("绝学: ${data[index]["gongfu"]}"),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

class ImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        Image.asset('images/lake.jpeg',
        height: 200.0,),
        Image.asset('images/lake.jpeg',
        height: 100,)
      ],
      ),
    );
  }

}
