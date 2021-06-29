import 'package:flutter/cupertino.dart';
import 'package:rxbuilder/rxbuilder.dart';
import 'package:rxdart/rxdart.dart';

class RxBuilderExample extends StatefulWidget {
  @override
  _RxBuilderExample createState() => _RxBuilderExample();
}

class _RxBuilderExample extends State<RxBuilderExample> {
  BehaviorSubject<dynamic> _behaviorSubject = BehaviorSubject();

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
        stream: _behaviorSubject,
        onDone: Container(),
        onSuccess: Container(),
        onLoading: Container(),
        onError: Container());
  }

  @override
  void dispose() {
    _behaviorSubject.close();
    super.dispose();
  }
}
