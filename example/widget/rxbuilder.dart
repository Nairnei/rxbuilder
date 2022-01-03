import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxbuilder/rxbuilder.dart';
import 'package:rxdart/rxdart.dart';

class RxBuilderExample extends StatefulWidget {
  @override
  _RxBuilderExample createState() => _RxBuilderExample();
}

class _RxBuilderExample extends State<RxBuilderExample> {
  BehaviorSubject<dynamic> _behaviorSubject = BehaviorSubject.seeded(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RxBuilder(
              stream: _behaviorSubject,
              onDone: Text("Done", style: TextStyle(color: Colors.black),),
              onSuccess: Text("Sucess", style: TextStyle(color: Colors.black),),
              onLoading: Text("Loading", style: TextStyle(color: Colors.black),),
              onError: Text("Error", style: TextStyle(color: Colors.black),),),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _behaviorSubject.close();
    super.dispose();
  }
}
