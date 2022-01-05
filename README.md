# rxbuilder

A Simple library create to manipulate state (stream/future) on Scalator Launcher

## Getting Started

## How To Use RxDart

### For Example: Reading the Konami Code

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
