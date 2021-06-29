library rxbuilder;

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class RxBuilder extends StatefulWidget {
  final BehaviorSubject<dynamic> stream;
  final Widget? onLoading;
  final Widget? onSuccess;
  final Widget? onError;
  final Widget? onDone;

  RxBuilder(
      {required this.stream,
      this.onLoading,
      this.onError,
      this.onSuccess,
      this.onDone});

  @override
  _RxBuilderState createState() => _RxBuilderState();
}

class _RxBuilderState extends State<RxBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return widget.onDone ?? Container();
            case ConnectionState.waiting:
              return widget.onLoading ?? Container();
            case ConnectionState.active:
              return widget.onSuccess ?? Container();
            case ConnectionState.done:
              return widget.onSuccess ?? Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}