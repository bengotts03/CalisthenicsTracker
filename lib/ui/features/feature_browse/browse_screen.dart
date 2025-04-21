import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

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

