import 'package:flutter/material.dart';

import 'blocs/example_bloc.dart';
import 'screens/example_screen.dart';

class App extends StatelessWidget {
  build(context) {
    return MaterialApp(
      title: 'Example',
      home: Scaffold(
        body: ExampleScreen(
          exampleBloc: ExampleBloc(),
        ),
      ),
    );
  }
}
