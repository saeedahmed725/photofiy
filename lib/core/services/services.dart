import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/core/services/locator.dart';
import 'package:photofiy/core/utils/bloc/bloc_observer.dart';
import 'package:photofiy/core/utils/helpers/shared_pref.dart';

import 'hive_service.dart';

class MyServices {
  MyServices._internal();

  static final MyServices instance = MyServices._internal();

  Future<MyServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    ServiceLocator.setup();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Future.wait([HiveService.init(), SharedPrefHelper.init()]);
    return this;
  }
}
