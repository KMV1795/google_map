import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/home_widget.dart';
import '../Model/post_json.dart';
import '../Model/image_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      appBarWidget(),
      gridViewWidget(stories),
      userDetailList(posts),
    ]);
  }
}
