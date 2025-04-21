import 'package:auto_route/annotations.dart';
import 'package:calisthenics_gym_app/data/services/router_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Logged in as: ${FirebaseAuth.instance.currentUser?.email}"),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              //context.go(AppRoutes.signIn);
            },
            child: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
