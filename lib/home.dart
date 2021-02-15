import 'package:ar_rad/getStatia.dart';
import 'package:ar_rad/main.dart';
import 'package:ar_rad/spisok.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: nested(),
    );
    // Container(
    //   child: Column(
    //     children: [news_Text(), news_Text()],
    //   ),
    // ),
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/fafa.txt');
  }

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "AR RAD",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Image.asset(
                "assets/main.jpg",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            title('Основа',
                'Здесь вы можете ознакомиться с терминологией, основами, правилами и принципами тех или иных наук.'),
            BannerWidgetArea(),
            title('Правовое', 'Мы подобрали для тебя самое актуальное.'),
            BannerWidgetAreaTwo(),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: title(
                    "'Ибада", 'Вопросы, связанные с поклонением и обрядами')),
            Ibadas(),
            titleAlone('Последние статьи'),
            news_Text(
                '564. Отличный ответ, на саляф-форумский навет. Ч.3. (О Сейид Кутбе)',
                '14,Март'),
          ],
        ),
      ),
    );
  }

  Widget title(string, sum) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                string,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                sum,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
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
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget news_Text(title, data) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Card(
        child: Container(
          width: double.infinity,
          height: 100,
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

var bannerItems = [
  "ЕДИНОБОЖИЕ",
  "ОСНОВЫ И ПРАВИЛА",
  "ТЕРМИНОЛО́ГИЯ",
  "БИОГРАФИИ",
  "ШАРХ ХАДИС",
  "МЕТОД ЗНАНИЙ",
  "НРАВ/ЭТИКЕТ",
  "ТАУБА",
];
var bannerItemss = [
  "ТАУХИД",
  "ОСНОВА",
  "ТЕРМИН",
  "ИМАМЫ",
  "ХАДИС",
  "МЕТОД",
  "НРАВ",
  "ТАУБА",
];
var bannerText = [
  "«Тебе одному мы поклоняемся, и Тебя одного молим о помощи» (Сура «аль-Фатиха», аят 5)",
  "Основы, принципы и правила фикха, тафсира хадиса и других наук.",
  "Термины из науки единобожия, хадисоведения, тафсира и фикха.",
  "Сегодня мусульманин должен знать истинных обладателей знания и почета.",
  "Толкование, разбор и анализ хадисов А также извлечение пользы из них",
  "Советы по учебе, улучшению памяти и навыков. Метод обучения.",
  "Нравственно-духовные качества и поведения. А также вопросы этикета.",
  "Покаяние, прощение, сожаление о грехах."
];
var bannerImage = [
  "assets/tauhid.png",
  "assets/osnovaipravila.png",
  "assets/termin.png",
  "assets/biography.png",
  "assets/sharhhadis.png",
  "assets/ucheba.png",
  "assets/nrav.png",
  "assets/tauba.png",
];
final db = FirebaseFirestore.instance;
var ad;

class Ibada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            width: 200,
            color: Colors.purple[600],
            child: const Center(
                child: Text(
              'Item 1',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
      title = bannerItems[x].toString();

      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Spisok(values: bannerItemss[x])));
          },
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0)
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    bannerImage[x],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bannerItems[x],
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      Text(
                        bannerText[x],
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
      banners.add(bannerView);
    }
    var screenHeiht = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeiht / 3.2,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}

var bannerTwoItems = [
  "ЖЕНЩИНА",
  "БРАК",
  " СЕМЕЙНОЕ",
  " РАЗВОД",
  " ОБЩЕСТВО",
  " ЗАКЯТ/ФИНАНС",
  " ОТКЛАНЕНИЯ",
  " РАЗНОЕ",
];
var bannerTwoItemsss = [
  "ЖЕНЩИНА",
  "БРАК",
  "СЕМЬЯ",
  "РАЗВОД",
  "ПОЛИТИКА",
  "ЗАКЯТ",
  "ОШИБКА",
  "РАЗНОЕ",
];
var bannerTwoText = [
  "Вопросы, касающиеся исключительно женщин",
  "Вопросы брака, сватовства и супружеского выбора.",
  "Отношение между супругами, родителями и родственниками",
  "Правила, этикет и примеры разводов в исламе.",
  "Общественные, политические и социальные вопросы.",
  "Все о сборе и выплаты закята, также бизнеса и торговли.",
  "Разъяснение ошибок и отклонений в тех, или иных вопросах",
  "Вопросы различного характера"
];
var bannerTwoImage = [
  "assets/zhenshina.png",
  "assets/brak.png",
  "assets/semya.png",
  "assets/razvod.png",
  "assets/obshestvo.png",
  "assets/zakyat.png",
  "assets/otklanenie.jpg",
  "assets/raznoe.jpg",
];

class BannerWidgetAreaTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    PageController controller =
        PageController(viewportFraction: 0.6, initialPage: 1);

    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerTwoItems.length; i++) {
      var twoBannerView = InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Spisok(values: bannerTwoItemsss[i])));
        },
        child: Container(
          child: Container(
            color: Colors.white10,
            width: 150,
            child: Column(
              children: [
                Image.asset(
                  bannerTwoImage[i],
                  width: 120,
                  height: 120,
                ),
                Center(
                  child: Text(
                    bannerTwoItems[i],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Center(
                  child: Text(
                    bannerTwoText[i],
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      banners.add(twoBannerView);
    }

    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          width: screenWidth,
          height: screenHeight / 3.2,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: banners,
          ),
        ));
  }
}

var ibadaImage = [
  'quran',
  'mecheti',
  'post',
  'safar',
  'minbar',
  'zhanaza',
  'daret',
  'dom',
  'namaz',
  'ait',
];

class Ibadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var counter = 1;
    List<Widget> banners = new List<Widget>();
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Spisok(values: 'КОРАН')));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/quran.png',
                      width: screenWidth / 2.4,
                      height: screenHeight / 3,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Spisok(values: 'НАМАЗ')));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'assets/mecheti.png',
                      width: screenWidth / 2.4,
                      height: screenHeight / 3,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ПОСТЫ')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/post.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // get_Tauhid();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'САФАР')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/safar.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ДЖУМА')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/minbar.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ЖАНАЗА')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/zhanaza.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ТАХАРАТ')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/daret.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'НАМАЗЫ')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/namaz.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ДОМ')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/dom.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spisok(values: 'ИД')));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'assets/ait.png',
                        width: screenWidth / 2.4,
                        height: screenHeight / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
