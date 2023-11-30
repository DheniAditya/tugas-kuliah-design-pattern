import 'counter_bloc.dart';
import 'counter_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();

    return MaterialApp(
      home: CounterWidget(bloc: counterBloc),
    );
  }
}
