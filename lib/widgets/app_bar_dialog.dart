import 'package:flutter/material.dart';

class AppBarDialog extends StatefulWidget {
  @override
  _AppBarDialogState createState() => _AppBarDialogState();
}

class _AppBarDialogState extends State<AppBarDialog> {

  static const List<String> _list=["All","TV Shows", "Movies", "My list", "Other"];
  String dialogSelected = "All";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector( //stateful widget
          onTap: (){
            // show dialog
            var result = showDialog(
              useRootNavigator: false,
              context: context,
              builder: (BuildContext context){
                return _buildDialogSelect();
            });
          },
          child: Row(
            children: [
              Text(
                dialogSelected,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white.withOpacity(0.6)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,8.0,8.0,8.0),
                child: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDialogSelect(){
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },//按了可以跳出
              child: ListView(
                shrinkWrap: true,
                children: List.generate(_list.length, (index) => _buildList(_list[index])),
              ),
            ),
          )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.cancel,
                size: 64.0,
                color: Colors.white
              ),
            ),
          ),
        )
      ]
    );
  }

  _buildList(String data) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(

            onTap: (){
              setState(() {
                dialogSelected=data;
              });
            },
            child: Text(
              data,
              style: TextStyle(
                  fontSize: dialogSelected == data ? 24.0 : 20.0,
                  color: dialogSelected == data
                      ? Colors.white
                      : Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
    );
  }
}




