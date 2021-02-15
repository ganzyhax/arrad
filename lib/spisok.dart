import 'package:ar_rad/getStatia.dart';
import 'package:ar_rad/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var bannerItems = [
  "ЕДИНОБОЖИЕ",
  " ОСНОВЫ И ПРАВИЛА",
  " ТЕРМИНОЛО́ГИЯ",
  " БИОГРАФИИ",
  " ШАРХ ХАДИС",
  " МЕТОД ЗНАНИЙ",
  " НРАВ/ЭТИКЕТ",
  " ТАУБА",
];
var take;

class Spisok extends StatelessWidget {
  String values;
  Spisok({this.values});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Statia(
        values: values,
      ),
    );
  }
}

class Statia extends StatelessWidget {
  String values;
  Statia({this.values});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
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
                      padding: EdgeInsets.only(top: 30, left: 30),
                      child: titleAlone(values))),
            ],
          ),
          LoginScreen(
            cotegory: values,
          ),
          // UserInformation(
          //     // text: values,
          //     ),
        ],
      ),
    );
  }
}

Widget titleAlone(string) {
  return Padding(
    padding: EdgeInsets.only(top: 30),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              string,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    ),
  );
}

final db = FirebaseFirestore.instance;
// var titles = [];

// class StatiaShow extends StatelessWidget {
//   String text;
//   StatiaShow({this.text});
//   Column someColumn = Column(
//     children: [],
//   );

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var banners = List<Widget>();
//     print(text);

//     db.collection("statia").get().then((querySnapshot) {
//       querySnapshot.docs.forEach((result) {
//         titles.add(result.data()[text]);
//       });
//     });

//     var data = titles[0];
//     print(data);

//     for (int i = 0; i < data.length; i++) {
//       print(data[i]);
//       var view = news_Text(data[i], '14 mart');
//       someColumn.children.add(view);
//     }
//     return Container(
//       child: someColumn,
//     );
//   }
// }
var titles = [];
Column someColumn = Column(
  children: [],
);

Widget news_Text(title, data) {
  return Padding(
    padding: EdgeInsets.only(top: 30),
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
                  Expanded(
                    child: Padding(
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
