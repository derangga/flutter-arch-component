import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_arch_component/src/base/bloc_event.dart';
import 'package:flutter_arch_component/src/base/bloc_state.dart';

abstract class BaseBloc<Event extends BlocEvent, State extends BlocState> {
  // Attach mapEventToState
  BaseBloc() {
    _eventController.stream.listen(mapEventToState);
  }

  final StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get _eventSink => _eventController.sink;

  final StreamController<State> _stateController = StreamController<State>();
  StreamSink<State> get _stateSink => _stateController.sink;
  Stream<State> get stateStream => _stateController.stream;

  State currentState;

  void mapEventToState(Event event);

  @mustCallSuper
  void dispose() {
    _eventController.close();
    _stateController.close();
  }

  void emitState(State state) {
    if (!_stateController.isClosed) {
      currentState = state;
      _stateSink.add(state);
    }
  }

  void pushEvent(Event event) {
    if (!_eventController.isClosed) {
      _eventSink.add(event);
    }
  }

  void setLog(String message) {
    print(message);
  }
}
