import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Observer extends BlocObserver {
  const Observer();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
