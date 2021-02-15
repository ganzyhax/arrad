import 'package:ar_rad/main.dart';
import 'package:ar_rad/spisok.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';

class NewStatia extends StatelessWidget {
  final String id;

  NewStatia({this.id});

  Column someColumn = Column(
    children: [],
  );
// AIzaSyCyk1jFD0yGNSjqJrA4WsX_dDMJdwD2TyI
  makeListWidget(AsyncSnapshot snapshot, context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    var gData;
    Map<String, dynamic> data = snapshot.data.data();
    // print(data['1']);
    print(data['info']);
    print(id + 'ID HERE');
    // print(title2['data'].toString() + 'asdasdadasd');
    // var data;
    // FirebaseFirestore.instance
    //     .collection('statia')
    //     .doc(id)
    //     .get()
    //     .then((DocumentSnapshot documentSnapshot) {
    //   data = documentSnapshot.data();
    // });
    var view;
    if (data['image'] != '') {
      view = Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Image.asset(
                    'assets/goBack.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: titleAlone('Статья'))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Html(
              data: "<img src =" + data['image'] + "> ",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Html(
              data: data['info'],
            ),
          ),
        ],
      );
    }

    someColumn.children.add(view);
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('statia')
                .doc(id)
                .snapshots(),
            builder: (context, snapshot) {
              return Container(
                child: makeListWidget(snapshot, context),
              );
            },
          ),
        ),
      ),
    );
  }
}
