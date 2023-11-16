
import 'package:flutter/material.dart';

class FadeAnimWidget extends StatelessWidget{
  const FadeAnimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FadeAnimWidget",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)
      ),
      home: const MyFadeWidget(title: "FadeWidget",),
    );
  }

}

class MyFadeWidget extends StatefulWidget{
  final String title;
  const MyFadeWidget({super.key,required this.title});

  @override
  State<StatefulWidget> createState()=>_MyFadeWidget();

}

class _MyFadeWidget extends State<MyFadeWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(microseconds: 1000),
        vsync: this
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FadeTransition(
          opacity: curve,
          child: const FlutterLogo(size: 100,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'fade',
        onPressed:(){
          controller.forward();
        },
        child: const Icon(Icons.brush),
      ),
    );
  }
}

// canvas自定义View
class CustomCanvasWidget  extends StatelessWidget{
  const CustomCanvasWidget({super.key});
  @override
  Widget build(BuildContext context) =>const Scaffold(body: Signature());
}

class Signature extends StatefulWidget{
  const Signature({super.key});

  @override
  SignatureState createState() =>SignatureState();
}

class SignatureState extends State<Signature>{
  List<Offset?> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details){
        setState(() {
          RenderBox? referenceBox = context.findRenderObject() as RenderBox;
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (details) => _points.add(null),
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter{
  SignaturePainter(this.points);
  final List<Offset?> points;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth =  5;
    for(int i = 0;i<points.length-1;i++){
      if(points[i]!=null&&points[i+1]!=null){
        canvas.drawLine(points[i]!, points[i+1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) => oldDelegate.points!=points;

}

class CustomButton extends StatelessWidget{
  final String label;
  const CustomButton(this.label,{super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: Text(label));
  }

}

// Intent跳转页面
class IntentPage extends StatelessWidget{
  const IntentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{
        '/a':(context)=> const IntentFirstPage("a Page"),
        '/b':(context)=> const IntentFirstPage("b Page"),
      },
      initialRoute: '/a',
    );
  }

}

 class IntentFirstPage extends StatelessWidget{
  final String name;
  const IntentFirstPage(this.name,{super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(name),
       ),
       body: ElevatedButton(
         onPressed: (){
           Navigator.of(context).pushNamed('/b');
         },
         child: const Text("IntentPage"),
       ),
     );
  }

 }

