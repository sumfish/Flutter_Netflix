import 'package:flutter/material.dart';
import 'package:custom_navigator/custom_navigator.dart';

class HeaderVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height* .7, //MediaQuery取得裝置數據，屏幕高度的0.7
      child: Stack(
        fit: StackFit.expand, //子元件延伸至stack大小
        children: [
          //背景圖案
          //一個Column包含該劇類別標籤，加入片單鍵，播放鍵，資訊鍵
          _buildBannerImg,
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                /*
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text("黑暗  ",style: TextStyle(
                        color: Colors.white),),
                    Text("刺激  ",style: TextStyle(
                        color: Colors.white),),
                    Text("奇幻動畫  ",style: TextStyle(
                        color: Colors.white),),
                    Text("動作動畫  ",style: TextStyle(
                        color: Colors.white),),
                    Text("神話與傳說  ",style: TextStyle(
                        color: Colors.white),),
                    Text("報復  ",style: TextStyle(
                        color: Colors.white),),
                  ],
                ),*/
                SizedBox(  //間隔用？？
                  height: 24.0,
                ),
                _buildHeaderButtonRow,
              ],
            ),
          )
        ],
      ),
    );
  }
}

Row get _buildHeaderButtonRow {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white,),
            Text('List', style: TextStyle(
                color: Colors.white),),
            SizedBox(
              width: 80,
            )
          ],
        ),
        Container(
          width: 90.0,
          padding: EdgeInsets.all(4.0),
          //color: Colors.white,  這邊顏色不能跟decoration同時出現
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.play_arrow,
                size: 30,
                color: Colors.black,
              ),
              Text(
                "Play",
                style: TextStyle(
                    color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, color: Colors.white,),
            Text("Info", style: TextStyle(
                color: Colors.white),),
            SizedBox(
              width: 80.0,
            )
          ],
        ),
      ]
  );
}

ShaderMask get _buildBannerImg {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(colors: [
        Colors.white,
        Colors.white,
        Colors.transparent
      ], stops: [
        0.0,
        0.3,
        1.0
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          .createShader(bounds);
    },
    child: Image.asset(
      "assets/Netflix_logo.png",
      fit: BoxFit.fitWidth,
    ),
  );
}
