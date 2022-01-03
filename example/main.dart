import 'package:flutter/material.dart';
import 'widget/rxbuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            children: [
              RxBuilderExample(),
            ],
          ),
        );
      },
    );
  }
}