import 'counter_bloc.dart';
import 'counter_event.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final CounterBloc bloc;

  CounterWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Pattern Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: widget.bloc.counter,
          initialData: 0,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${snapshot.data}'),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.bloc.counterEventSink.add(IncrementEvent());
                      },
                      child: Text('+'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        widget.bloc.counterEventSink.add(DecrementEvent());
                      },
                      child: Text('-'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
