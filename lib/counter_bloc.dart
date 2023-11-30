import 'counter_event.dart';
import 'dart:async';

class CounterBloc {
  int _counter = 0;
  final _counterStateController = StreamController<int>();
  final _counterEventController = StreamController<CounterEvent>();

  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
