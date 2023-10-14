import 'package:flutter/material.dart';


class ZeroPage extends StatelessWidget{
  const ZeroPage({super.key});

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
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
class ScaffoldPage extends StatelessWidget{
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("ScaffoldDemo"),
      ) ,
      body: const Padding(
        padding:EdgeInsets.all(30.0),
        child: Text("Scaffold"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50,),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("抽屉"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }

}

class FirstPage extends StatelessWidget{
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("FirstPage"),),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MaterialButton(
          child: const Text("跳转第二页"),
          onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }

}

class SecondPage extends StatelessWidget{
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
          onPressed: (){
            Navigator.pop(context,const FirstPage());
          },
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
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
        child: Directionality(textDirection: TextDirection.ltr, child: _widget.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
              label: "通讯录"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
              label: "设置"
          )
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),

    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

}

