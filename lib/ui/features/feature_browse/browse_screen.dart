import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WorkoutBrowseScreen extends StatelessWidget {
  const WorkoutBrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BrowserItem(),
        ],
      )
    );
  }
}

class BrowserItem extends ListTile {
  const BrowserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

