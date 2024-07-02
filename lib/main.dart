import 'package:flutter/material.dart';
import 'package:netflix_clonecode/widget/bottom_bar.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Container(child: Center(child: Text('home'),),),
              Container(child: Center(child: Text('search'),)),
              Container(child: Center(child: Text('save'),)),
              Container(child: Center(child: Text('more'),)),
            ],
            physics: NeverScrollableScrollPhysics(), //사용자가 손가락 모션을 통해 스크롤을 막겠다.
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
