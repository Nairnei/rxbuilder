library rxbuilder;

import 'package:flutter/material.dart';

class RxBuilder extends StatefulWidget {
  final Widget? onLoading;
  final Widget? onSuccess;
  final Widget? onError;
  final Widget? onDone;
  final bool? keepAlive;
  final ConnectionState state;

  RxBuilder(
      {this.onLoading,
        this.onError,
        this.onSuccess,
        this.onDone,
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
        return widget.onDone ?? Container();
      case ConnectionState.waiting:
        return widget.onLoading ?? Container();
      case ConnectionState.active:
        return widget.onSuccess ?? Container();
      case ConnectionState.done:
        return widget.onSuccess ?? Container();
    }
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? false;
}
