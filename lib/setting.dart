import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // background:
    // Colors.white;
    return Scaffold(
        appBar: AppBar(
          title: const Text('ИНФО'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              toGo(),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 140),
                child: Text(
                  'Мы в соц.сети :',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.left,
                ),
              ),
              soc(),
            ],
          ),
        ));
  }
}

Widget customDivider(String title) {
  return Row(
    children: [
      Expanded(
        child: Container(
          color: Colors.white,
          height: 10,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 30),
        )),
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          height: 10,
        ),
      ),
    ],
  );
}

var names = [
  "Баланс сайта",
  "Задать вопрос",
  "Кто мы?",
  "Метод работы ar-rad",
  "Наши взгляды",
  "Помощь проекту",
  "Сообщить об ошибке",
];
Widget card(title) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    padding: EdgeInsets.all(10.0),
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 6.0,
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

soc() {
  return Padding(
    padding: EdgeInsets.only(left: 40),
    child: Container(
      child: Row(
        children: [
          InkWell(
            onTap: () => launch('https://vk.com/ar_rad_ru'),
            child: Image.network(
              "https://5bucks.ru/wp-content/uploads/2017/05/vk1.png",
              height: 100,
              width: 100,
            ),
          ),
          InkWell(
            onTap: () => launch('https://t.me/arradru'),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/1200px-Telegram_2019_Logo.svg.png",
              height: 40,
              width: 90,
            ),
          ),
          InkWell(
            onTap: () => launch('https://www.instagram.com/ar_rad.ru/'),
            child: Image.network(
              "https://i0.wp.com/itc.ua/wp-content/uploads/2020/10/instagram-logo.wine_.png",
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    ),
  );
}

toGo() {
  Column col = Column(
    children: [],
  );
  for (int x = 0; x < names.length; x++) {
    var name = names[x].toString();
    print(name);
    col.children.add(card(name));
  }
  return col;
}
