# RxBuilder

A Simple library create to manipulate state (stream/future) on Scalator Launcher

## What is the purpose?

Minimize the handling of the possible states of the connection state within the future / stream builder.

## What is required?

* state: your current state from async
* onDone: your widget for the success

### Other Widgets is required?

No, Other widgets by default return a simple empty container

## How To Use RxBuilder

```dart
import 'package:rxbuilder/rxbuilder.dart';

StreamBuilder<dynamic>(
    stream: yourStream,
    builder: (context, snapshot) {
      return RxBuilder(
      
        /// Flag to keepAlive this widget
        keepAlive: true,
      
        /// Current state from asynchronous computation (stream / future)
        state: snapshot.connectionState,
        
        /// Widget to show a active asynchronous computation.
        onActive: Text("Active"),
        
        /// Widget to show a terminated asynchronous computation.
        onDone: Text('Done'),
        
        /// Widget to show awaiting interaction.
        onWaiting: Text("Load"),
        
        /// Widget to show any asynchronous computation.
        onNone: Text("None"),
        
         /// Widget to show a error on asynchronous computation
        onError: Text('Error'),
        
      
      );
    }),
}
```

## Future improvements

* Multi stream;
* Set default states for onError;
* Set default onNone;
* Set default onWaiting.