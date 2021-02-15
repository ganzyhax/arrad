import 'package:ar_rad/main.dart';
import 'package:ar_rad/newStatia.dart';
import 'package:ar_rad/spisok.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatelessWidget {
  String cotegory;
  LoginScreen({this.cotegory});
  Column someColumn = Column(
    children: [],
  );
  makeListWidget(AsyncSnapshot snapshot, context) {
    var parsed = snapshot.data.docs[1].get(cotegory);

    // snapshot.data.docs['ЕДИНОБОЖИЕ'][0]
    // print(parsed[0]);
    for (int i = 0; i < parsed.length; i++) {
      // print(parsed[1].toString() + 'HERE');

      var toGo = parsed[i].toString();
      toGo = toGo.replaceAll(new RegExp(r"\s+"), "");
      print(toGo);
      var title2 = snapshot.data.docs[0][toGo];

      print(title2['title'].toString() + 'herererere');
      var common = title2['title'].toString();

      var commons = common.split(".");

      var view = Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewStatia(
                              id: commons[0],
                            )));
              },
              child: news_Text2(
                title2['title'],
                '14 mart',
                common[0],
              ))
        ],
      );

      someColumn.children.add(view);
    }
    return someColumn;
  }
  //     for (int i = 0; i < info.length; i++) {
  //       var view = news_Text(info[i], '14 mart');
  //       someColumn.children.add(view);
  //     }
  //     return Container(
  //       child: someColumn,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('statiaLink').snapshots(),
        builder: (context, snapshot) {
          return Container(
            child: makeListWidget(snapshot, context),
          );
        },
      ),
    );
  }

  Widget news_Text2(title, data, common) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Card(
        child: Container(
          width: double.infinity,
          child:
              // width: 100,
              // height: double.infinity,

              Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/calendar.png',
                              width: 20,
                              height: 20,
                            ),
                            Text(data)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/commentary.png',
                              width: 20,
                              height: 20,
                            ),
                            Text('5')
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 90,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/user.png',
                              width: 20,
                              height: 20,
                            ),
                            Text('AR RAD')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
