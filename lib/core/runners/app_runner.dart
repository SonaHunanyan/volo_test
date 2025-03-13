import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:volo_test/core/initialization/initialization.dart';
import 'package:volo_test/core/ui/volo_test_app.dart';

class Runner {
  static Future<void> run() async {
    await initializeApp(
      onSuccess: () {
        runApp(const VoloTestApp());
      },
      onError: (error, stackTrace) {
        log(error.toString());
      },
    );
  }
}
