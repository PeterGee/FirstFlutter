import 'package:flutter/material.dart';
import 'package:helloflutter/Demo.dart';

void main() {
  runApp(
    LongListView(items: List<String>.generate(1000, (index) => "Items $index"),),
  );
}

