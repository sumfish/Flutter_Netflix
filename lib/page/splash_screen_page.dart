import 'package:flutter/material.dart';
import 'package:flutter_netflix/page/navi_screen.dart';

class SplashScreenPage extends StatefulWidget{
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{

  double logoOpacity= 1.0; // ask when == 0.0
  bool startAnimation = false;

  @override
  void initState() { //first build之前
    super.initState();
    //
    Future.delayed(Duration(seconds: 1),() { //建立一個延遲`Future`任務，讓它在一秒之後執行
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:AnimatedOpacity(
          //opacity: 0.0,??
          opacity: startAnimation? 0.0:1.0,
          duration: Duration(milliseconds: 2000),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 2000),
              width: startAnimation? 150.0:250.0,
              child:Image.asset("assets/Netflix_logo.png")),
          onEnd: (){
            //動畫結束時跳轉
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> NavScreen()));
          },),
      ),
    );
  }
}
