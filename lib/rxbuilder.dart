library rxbuilder;

import 'package:flutter/material.dart';

class RxBuilder extends StatefulWidget {
  /// Current state from asynchronous computation (stream / future)
  final ConnectionState state;

  /// Flag to keepAlive this widget
  final bool? keepAlive;

  /// If true Show onActive, default is false, then show OnActive is replaced for onDone
  final bool? showOnProgress;

  /// Widget to show any asynchronous computation.
  final Widget? onNone;

  /// Widget to show awaiting interaction.
  final Widget? onWaiting;

  /// Widget to show a terminated asynchronous computation.
  final Widget onDone;

  /// Widget to show a in progress asynchronous computation.
  final Widget? onActive;

  /// Widget to show a error on asynchronous computation
  final Widget? onError;

  const RxBuilder(
      {this.onNone,
      this.onWaiting,
      required this.onDone,
      this.onError,
      this.onActive,
      this.keepAlive,
      this.showOnProgress,
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
        if (widget.showOnProgress ?? false) {
          return widget.onActive ?? Container();
        } else {
          return widget.onDone;
        }

      case ConnectionState.done:
        return widget.onDone;
    }
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? false;
}
