import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calisthenics_gym_app/data/services/router_service.dart';
import 'package:calisthenics_gym_app/router/router.dart';
import 'package:calisthenics_gym_app/ui/features/feature_home/home_screen.dart';
import 'package:calisthenics_gym_app/ui/features/feature_main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<UserCreated>((context, state){
                context.router.push(MainRoute());;
              }),
              AuthStateChangeAction<SignedIn>((context, state){
                context.router.push(MainRoute());;
              }),
            ],
          );
        }
        return MainScreen();
      },
    );
  }
}