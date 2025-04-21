import 'package:flutter/material.dart';

class AppBarContentWidget extends InheritedWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget? extraContent;

  const AppBarContentWidget({
    required this.title,
    this.subtitle = '',
    this.actions = const [],
    this.extraContent,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static AppBarContentWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBarContentWidget>();
  }

  @override
  bool updateShouldNotify(AppBarContentWidget oldWidget) {
    return title != oldWidget.title ||
        subtitle != oldWidget.subtitle ||
        actions.length != oldWidget.actions.length ||
        extraContent != oldWidget.extraContent;
  }
}