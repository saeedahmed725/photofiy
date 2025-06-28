import 'package:flutter/material.dart';

import 'app/photofiy.dart';
import 'core/services/services.dart';

Future<void> main() async {
  await MyServices.instance.init();
  runApp(const Photofiy());
}
