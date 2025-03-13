import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volo_test/core/initialization/bloc_observer.dart';
import 'package:volo_test/core/initialization/initialize_dependencies.dart';

Future<void> initializeApp({
  required VoidCallback onSuccess,
  void Function(Object error, StackTrace stackTrace)? onError,
}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Bloc.observer = AppBlocObserver();
    initializeDependencies();
    onSuccess();
  } catch (error, stackTrace) {
    onError?.call(error, stackTrace);
  }
}
