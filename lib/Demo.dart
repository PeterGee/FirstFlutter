import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Basic List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text("map"),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("album"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("phone"),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Grid List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubTitle(BuildContext context) => Text(sender);

  @override
  Widget buildTitle(BuildContext context) => Text(body);
}

class ComplexList extends StatelessWidget {
  final List<ListItem> items;

  const ComplexList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubTitle(context),
              );
            }),
      ),
    );
  }
}

class LongListView extends StatelessWidget {
  final List<String> items;

  const LongListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = "Long List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            prototypeItem: ListTile(
              title: Text(items.first),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            }),
      ),
    );
  }
}

class Location{
   final String imageUrl;
   final String name;
   final String place;
  Location(this.imageUrl,this.name,this.place);
}

class ParallaxRecipe extends StatelessWidget{
  const ParallaxRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    String picUrl= "https://img95.699pic.com/photo/60037/3151.jpg_wh300.jpg";
    const title = "CustomScrollView";
    final List<Location> Locations =  List.generate(100, (index) => Location(picUrl, "银杏树$index", "银杏树"));

    return  SingleChildScrollView(
      child: Column(
        children: [
            for (final location in Locations)
              LocationListItem(
                imageUrl: location.imageUrl,
                name: location.name,
                country: location.place,
              )
        ],
      ),
    );
  }
}

class MyCustomApp extends StatelessWidget {
  const MyCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: ParallaxRecipe(),
        ),
      ),
    );
  }
}


class ParallaxFlowDelegate extends FlowDelegate{
  ParallaxFlowDelegate();

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {

  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
   return true;
  }

}

class LocationListItem extends StatelessWidget{
  final String imageUrl;
  final String name;
  final String country;

  const LocationListItem({
    super.key,
  required this.imageUrl,
  required this.name,
  required this.country});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: AspectRatio(
          aspectRatio: 16/9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubtitle()
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context){
    return Positioned.fill(child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
    ));
  }
  
  Widget _buildGradient(){
    return Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent,Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const[0.6,0.95]
            )
          ),
        )
    );
  }

  Widget _buildTitleAndSubtitle(){
    return Positioned(
        left: 20,
        bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          ),
          Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30)
      ),
    );
  }

}




