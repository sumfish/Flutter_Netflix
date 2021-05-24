import 'package:flutter/material.dart';
import 'package:flutter_netflix/widgets/header_video.dart';
import 'package:flutter_netflix/widgets/preview.dart';
import 'package:flutter_netflix/widgets/app_bar_dialog.dart';

class HomePage extends StatefulWidget {

  /// 記錄跳轉資訊
  const HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey(debugLabel: "test scaffoldState");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black,
      body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                snap: false,
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("TV Shows"),
                    Text("Movies"),
                    Text("My list"),
                    AppBarDialog(),
                  ],
                ),
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: Colors.white, fontSize: 14.0
                  )
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/Netflix_N.png"),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    HeaderVideo(),
                    Preview(title:'Previews', key: PageStorageKey('preview'),),
                    _buildRecommendedMenu("Trending"),
                    _buildRecommendedMenu("Recommedation"),
                    SizedBox(
                      height: 30.0,
                    )
                  ])
              ),
            ]),
    );
  }

  Widget _buildRecommendedMenu(String title, {List playList}) {
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
        SizedBox(
          height: 150, //限制高度否則報錯
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(8, (index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink( //inkwell外面要套ink 不是container
                    width:100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage("assets/videolist/ACE.jpeg"),
                            fit: BoxFit.cover)
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onLongPress: (){
                        //呼叫不到
                        _globalKey.currentState.showSnackBar(SnackBar(content: Text("動畫名字")));
                      },
                    ),
                  ),
                );
              })
          ),
        )
      ],
    );
  }

}







