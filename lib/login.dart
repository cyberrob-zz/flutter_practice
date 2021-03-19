import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新增定存口袋")),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [_createNameInput()],
            ),
          ),
          _createPockets(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                      child: Text("下一步",
                          style: TextStyle(
                            fontSize: 20,
                          ))),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _createNameInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(alignment: Alignment.centerLeft, child: Text("口袋名稱 (限16字)")),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
          alignment: Alignment.centerLeft,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "寫下你的夢想",
                hintText: "寫下你的夢想"),
            autofocus: false,
          ),
        )
      ],
    );
  }

  Widget _createPockets(BuildContext context) {
    return SliverGrid(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate: SliverChildListDelegate(
        [
          _createSinglePocket(context, "Travel", 0),
          _createSinglePocket(context, "Dream", 1),
          _createSinglePocket(context, "Housing", 2),
          _createSinglePocket(context, "Car", 3),
          _createSinglePocket(context, "Marriage", 4),
          _createSinglePocket(context, "Education", 5),
          _createSinglePocket(context, "Investment", 6),
          _createSinglePocket(context, "Saving", 7),
          _createSinglePocket(context, "Shopping", 8)
        ],
      ),
    );
  }

  Widget _createSinglePocket(
      BuildContext context, String pocketName, int colorIdx) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("$colorIdx: $pocketName"),
                  content: Text(pocketName),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("No")),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes"))
                  ],
                ));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
                child: Container(
              width: 75.0,
              height: 75.0,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: _listOfColors[colorIdx]),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.4gamers.com.tw/ckfinder/images/Katy/comic%20animation-1/210112-morcar-03.jpg?versionId=nWjhmb996oqJJIk16PK2XtbE7VmZJzEj"),
              ),
            )),
            Container(
              margin: EdgeInsets.all(4.0),
              child: Text(
                pocketName,
                style: TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  var _listOfColors = [
    Colors.amber,
    Colors.pink,
    Colors.blue,
    Colors.deepOrange,
    Colors.deepPurpleAccent,
    Colors.lightGreenAccent,
    Colors.teal,
    Colors.red,
    Colors.yellow
  ];
}
