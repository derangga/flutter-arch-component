import 'package:flutter_arch_component/src/base/bloc_event.dart';
import 'package:flutter_arch_component/src/base/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  void setLog(String message) {
    print(message);
  }
}
