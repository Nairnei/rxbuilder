library rxbuilder;

import 'package:flutter/material.dart';

class RxBuilder extends StatefulWidget {
  final Widget? onNone;
  final Widget? onWaiting;
  final Widget? onDone;
  final Widget? onError;
  final Widget? onActive;

  final bool? keepAlive;
  final ConnectionState state;

  RxBuilder(
      {this.onNone,
      this.onWaiting,
      this.onDone,
      this.onError,
      this.onActive,
      this.keepAlive,
      required this.state});

  @override
  _RxBuilderState createState() => _RxBuilderState();
}

class _RxBuilderState extends State<RxBuilder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    switch (widget.state) {
      case ConnectionState.none:
        return widget.onNone ?? Container();
      case ConnectionState.waiting:
        return widget.onWaiting ?? Container();
      case ConnectionState.active:
        return widget.onActive ?? Container();
      case ConnectionState.done:
        return widget.onDone ?? Container();
    }
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? false;
}
