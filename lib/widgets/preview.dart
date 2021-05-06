import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_netflix/page/detail_page.dart';

class Preview extends StatelessWidget {

  ///外部傳入
  final String title;
  const Preview({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
        SizedBox( //其實也可以用container
          height: 110, //限制高度否則報錯
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(8, (index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children:[
                      Ink( //inkwell外面要套ink 不是container
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromRGBO(
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255),
                                1),
                          width: 2.0),
                          image: DecorationImage(
                              image: AssetImage("assets/videolist/ACE.jpeg"),
                              fit: BoxFit.cover)
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder:(BuildContext context)=> DetailPage()));
                        },
                        onLongPress: (){
                          //呼叫不到
                          //_globalKey.currentState.showSnackBar(SnackBar(content: Text("動畫名字")));
                        },
                      ),
                      ),
                      //也可以用position
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Color.fromRGBO(255, 255, 255, 0.4)
                          ),
                          child: Text(
                            "One piece", style: TextStyle(fontSize: 20.0, color: Colors.black54),
                          ),
                        ),
                      )
                    ]
                  ),
                );
              })
          ),
        )
      ],
    );
  }
}
