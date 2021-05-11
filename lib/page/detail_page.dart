import 'dart:ui';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin{

  TabController _tabController;
  int selectedIndex = 0;


  @override
  void initState() {
    _tabController = TabController(
        length: 2,
        initialIndex: selectedIndex,
        vsync: this,
    );
    super.initState();
    // generateEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height* .8,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/videolist/LUFI.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            //child: Column(  //要用listview
            child: ListView(
              //mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //expand要跟column等等一起用
                Container( /// !!! 擴充填滿整個可視空間
                    child:BackdropFilter( //blur effects 元件之下（所以要用stack）
                      filter: ImageFilter.blur(sigmaX: 13.0, sigmaY: 13.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 4/3,
                          child: Image.asset(
                            "assets/videolist/LUFI.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "2020", style: TextStyle(color: Colors.green),
                    ),
                    Text("1季", style: TextStyle(color: Colors.green),)
                  ],
                ),
                Align(
                  child: Text(
                    "第1季上線",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    width: double.infinity,
                    padding: EdgeInsets.all(4.0),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Play",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "ACE ><><><><><><\nACE ><><><><><><\nACE ><><><><><><\nACE ><><><><><><",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "actor：AAA, BBB, CCC",
                      style: TextStyle(color: Colors.grey),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          Text('List', style: TextStyle(color: Colors.white),),
                          SizedBox(
                            width: 80,
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.thumb_up, color: Colors.white),
                          Text('Score', style: TextStyle(color: Colors.white),),
                          SizedBox(
                            width: 80,
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Text('Share',  style: TextStyle(color: Colors.white),),
                          SizedBox(
                            width: 80,
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                //Tab 置放？？

                TabBar(
                  indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.red, width: 4.0),
                      )),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: "Episode",
                    ),
                    Tab(
                      text: "Related",
                    ),
                  ],
                  isScrollable: true, //預設的indicator或label是自動變分配螢幕寬度
                  onTap: (int index) {
                    setState(() {
                      selectedIndex = index;
                      _tabController.animateTo(index);
                    });
                  },
                ),
                IndexedStack(
                  children: [
                    _buildAllEpisodes(),
                    _buildRelatedSeries()
                  ],
                  index: selectedIndex,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRelatedSeries(){
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: 50),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      childAspectRatio: 9 / 12,
      children: List.generate(9, (index) => _buildEachRelatedSeries()),
    );
  }

  _buildEachRelatedSeries() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              image: AssetImage("assets/videolist/ACE.jpeg"),fit: BoxFit.cover)),
    );
  }

  Widget _buildAllEpisodes() {
    //集數或者類似影片
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4.0)),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("第一季"),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        //for (Episode i in _listEpisodes) _buildEachEpisode(i),
      ],
    );
  }
}


