import 'package:calisthenics_gym_app/firebase_options.dart';
import 'package:calisthenics_gym_app/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /* Initialize Router and set a callback so that everytime the User login status changes, the router updates to the relevant page */
  FirebaseAuth.instance.authStateChanges().listen((User? user){

  });

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
