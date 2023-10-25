import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZeroPage extends StatelessWidget {
  const ZeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ZeroPage",
      home: const ScaffoldPage(),
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => const FirstPage(),
        '/second': (BuildContext context) => const SecondPage(),
      },
      initialRoute: '/first',
    );
  }
}

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScaffoldDemo"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Text("Scaffold"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("抽屉"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MaterialButton(
          child: const Text("跳转第二页"),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          child: const Text("返回第一页"),
          onPressed: () {
            Navigator.pop(context, const FirstPage());
          },
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widget = <Widget>[
    Text(
      'Index 0:首页',
      textDirection: TextDirection.ltr,
    ),
    Text(
      'Index 1:通讯录',
      textDirection: TextDirection.ltr,
    ),
    Text(
      'Index 2:设置',
      textDirection: TextDirection.ltr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBar demo"),
      ),
      body: Center(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: _widget.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "设置")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyTabController extends StatelessWidget {
  const MyTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("DefaultTapController demo"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "热点",
                ),
                Tab(
                  text: "体育",
                ),
                Tab(
                  text: "科技",
                ),
                Tab(
                  text: "娱乐",
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("热点"),
              ),
              Center(
                child: Text("体育"),
              ),
              Center(
                child: Text("科技"),
              ),
              Center(
                child: Text("娱乐"),
              ),
            ],
          ),
        ));
  }
}

// 自定义TabController
class MyCustomTabController extends StatefulWidget {
  const MyCustomTabController({super.key});

  @override
  _MyStatefulWidgetState1 createState() => _MyStatefulWidgetState1();
}

class _MyStatefulWidgetState1 extends State<MyCustomTabController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义TabController'),
        bottom: TabBar(
          tabs: const <Widget>[
            Tab(
              text: '热点',
            ),
            Tab(
              text: '体育',
            ),
            Tab(
              text: '科技',
            ),
          ],
          controller: _tabController, //1
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: Text('热点')),
          Center(child: Text('体育')),
          Center(child: Text('科技')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

// DrawerView
class MyDrawerStateWidget extends StatefulWidget {
  const MyDrawerStateWidget({super.key});

  @override
  DrawerState createState() => DrawerState();
}

class DrawerState extends State<MyDrawerStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Demo"),
      ),
      drawer: _drawer,
    );
  }

  get _drawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Peter"),
              accountEmail: Text("geqipeng@sina.cn"),
              currentAccountPicture: CircleAvatar(
                child: Text("X"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text("邮件"),
            ),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text("设置"),
            ),
          ],
        ),
      );
}

// listView使用
class ListViewWidget extends StatelessWidget{
  final List<String> items;

   ListViewWidget({required this.items});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView Demo"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(
                  width: 1,
                  color: Colors.blueGrey
                ))
              ),
              child: ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }

}

// GridView 使用
class GridViewWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter GridView",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GridView demo"),
        ),
        body: GridView.count(crossAxisCount: 3,
        children:const <Widget> [
          ListTile(
            title: Text("item1"),
          ),
          ListTile(
            title: Text("item2"),
          ),
          ListTile(
            title: Text("item3"),
          ),
          ListTile(
            title: Text("item4"),
          ),
          ListTile(
            title: Text("item5"),
          ),
          ListTile(
            title: Text("item6"),
          ),
        ],),
      ),
    );
  }

}

class PagerViewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("pagerViewDemo"),
        ),
        body: PageView(
          onPageChanged: (index){
            print("当前为第$index 页");
          },
          children:const <Widget> [
            ListTile(
              title: Text("第一页"),
            ),
            ListTile(
              title: Text("第二页"),
            ),
            ListTile(
              title: Text("第三页"),
            ),
          ],
        ),
      ),
    );
  }

}

class GestureDetectorWidget extends StatelessWidget{
  const GestureDetectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GestureDetector"),
        ),
        body: Center(
          child: GestureDetector(
            child: const Text("手势识别"),
            onTap: (){
              print("点击");
            },
            onDoubleTap: (){
              print("双击");
            },
            onLongPress: (){
              print("长按");
            },
            onHorizontalDragStart: (DragStartDetails details){
              print("水平拖动");
            },
          ),
        ),
      ),
    );
  }

}

// 滑动删除
class DismissibleWidget extends StatelessWidget{

  final List<String> items;

  const DismissibleWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DismissibleWidget demo"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder:(context,index){
              final item = items[index];
              return Dismissible(
                  key: Key(item),
                  onDismissed: (direction){
                    items.remove(index);
                    print(index);
                  },
                  child: ListTile(
                    leading: const Icon(Icons.access_time),
                    title: Text(items[index]),
                  )
              );
            }
        ),
      ),
    );
  }

}

// 读取assets文件
class AssetsWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "flutter",
     home: Scaffold(
       appBar: AppBar(
         title: const Text("加载文本示例"),
       ),
       body: JsonWidget(),
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


Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/swordsmen.json');
}

class _JsonWidgetState extends State<JsonWidget>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: DefaultAssetBundle.of(context).loadString("assets/swordsmen.json"),
      builder:(context,snapshot){
        if(!snapshot.hasData){
          print("没有数据");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          print("有数据");
          List<dynamic> data = json.decode(snapshot.data.toString());
          return ListView.builder(itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
            return Card(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("名字:${data[index]["name"]}"),
                Text("绝学:${data[index]["gongfu"]}")
              ],
            ),);
          },);
        }
      });
  }
}






