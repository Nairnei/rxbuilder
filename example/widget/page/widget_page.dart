import 'package:flutter/material.dart';
import 'package:rxbuilder/rxbuilder.dart';

import '../../bloc/controller_logic.dart';
import 'controller_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ctrlHomeWidget.init();
    ctrlHomeLogic.init();
  }

  @override
  void dispose() {
    ctrlHomeWidget.dispose();
    ctrlHomeLogic.init();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<dynamic>(
                stream: ctrlHomeLogic.subjectCounter,
                builder: (context, snapshot) {
                  return RxBuilder(
                    keepAlive: true,
                    state: snapshot.connectionState,
                    onActive: Text("Active"),
                    onDone: Text('Done'),
                    onWaiting: Text("Load"),
                    onNone: Text("None"),
                    onError: snapshot.hasError
                        ? Text(snapshot.error.toString())
                        : Container(),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ctrlHomeLogic.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
