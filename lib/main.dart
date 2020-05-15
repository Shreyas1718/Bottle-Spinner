import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController rotationController;
  var firstPosition=0.0;
  var random=new Random();
  double getRandomNumber(){
    firstPosition=random.nextDouble();
    return firstPosition;
  }
  @override
  void initState() {
    rotate();
    super.initState();
  }
  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
  rotate(){
    rotationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    rotationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
            onTap: (){
              if(rotationController.isCompleted){
                setState(() {
                  rotate();
                });
              }
            },
            child: RotationTransition(turns:Tween(begin: firstPosition,end: getRandomNumber()*3).animate(CurvedAnimation(parent: rotationController,curve: Curves.linear)),alignment:Alignment.center,child: Image.asset('assets/bottle.png',width: 300,height: 300,))),

      ),
    ));
  }
}

