import 'dart:async';

import 'package:architecture_samples_shopping_app/bloc/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  CounterBloc() {
    _counterEventController.stream.listen(_handleEvent);
  }

  void _handleEvent(CounterEvent event) {
    if (event is IncrementCounter) {
      _counter++;
    }
    if (event is DecrementCounter) {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
