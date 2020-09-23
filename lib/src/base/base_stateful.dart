import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_arch_component/src/base/bloc_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'base_bloc.dart';

abstract class BaseState<B extends BaseBloc, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  B bloc;

  void initBloc();
  Widget mapStateHandler(BS state);

  @override
  void didChangeDependencies() {
    initBloc();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void setLog(String message) {
    print(message);
  }

  void showToast(String message,
      {Color textColor = Colors.black, Color backgroundColor = Colors.white}) {
    Fluttertoast.showToast(
        msg: message, textColor: textColor, backgroundColor: backgroundColor);
  }

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
  }
}
