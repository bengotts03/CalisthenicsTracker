import 'package:flutter/material.dart';

mixin AppBarContentProvider{
  Widget? buildAppBarExtraContent(BuildContext context);
  String getAppBarTitle();
  String getAppBarSubtitle();
  List<Widget> getAppBarActions();
}