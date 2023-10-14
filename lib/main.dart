import 'package:flutter/material.dart';
import 'package:helloflutter/DartDemo.dart';

void main() {
  runApp(
       DismissibleWidget(items: List<String>.generate(100, (index) => "第$index行"),)
  );
}



