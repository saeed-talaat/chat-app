import 'package:bloc/bloc.dart';
import 'package:chat_app/core/routes/app_router.dart';
import 'package:chat_app/core/services/service_locator.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';
import 'package:chat_app/core/utils/app_bloc_observer.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.setup();
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const new({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
