import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_arch_component/src/base/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseState<B extends BlocBase, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  late B bloc;

  Widget mapStateHandler(BS state);

  void setupOnInitState();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<B>(context);
    setupOnInitState();
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
    WidgetsBinding.instance!.addPostFrameCallback(frameCallback);
  }
}
