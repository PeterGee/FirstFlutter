
import 'package:flutter/material.dart';

// 水平方向布局
class RowWidget extends StatelessWidget{
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar:AppBar(
          title: const Text("RowDemo"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Row(
            children: <Widget>[
              Text("Android 开发"),
              Text("Kotlin 开发")
            ],
          ),
        ),
      ),
    );
  }

}

// 流式布局
class ChipWidget extends StatelessWidget{
  const ChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("流式布局样式"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Wrap(
            direction: Axis.horizontal,// 主轴方向
            spacing: 8.0,// 主轴方向间距
            runSpacing: 12.0,// 交叉方向间距
            children:<Widget> [
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('1'),
                  ),
                  label: Text("Android进阶之光")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('2'),
                  ),
                  label: Text("Android进阶解密")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('3'),
                  ),
                  label: Text("Android进阶之禅")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('4'),
                  ),
                  label: Text("Android进阶之禅")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('5'),
                  ),
                  label: Text("Android开发艺术探索")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('6'),
                  ),
                  label: Text("Android从小工到专家")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('7'),
                  ),
                  label: Text("Android第一行代码")),
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('8'),
                  ),
                  label: Text("Android第一行代码第二版")),
            ],
          ),
        ),
      ),
    );
  }

}

//  层式布局
class StackWidget extends StatelessWidget{
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "层式布局",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("层式布局样式"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children:<Widget> [
            Positioned(
              left: 90,
                top: 120,
                child: Image.asset('images/lake.jpeg',
                  width: 200,
                  fit: BoxFit.cover,
                ),
            ),
            Container(
              height: 50.0,
              width: 100.0,
              alignment: Alignment.center,
              child: const Text('Android进阶三部曲第二部',
                  style: TextStyle(
                      color: Colors.lightBlue, fontSize: 20.0)),
            )
          ],
        ),
      ),
    );
  }

}

// 弹性布局
class FlexWidget extends StatelessWidget{
  const FlexWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Flutter",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("弹性布局"),
          ),
          body: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 30,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    width: 30,
                    color: Colors.blue,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    width: 30,
                    color: Colors.amber,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    width: 30,
                    color: Colors.black12,
                  )),
            ],
          ),
        ),
      );
  }

}