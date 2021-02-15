import 'package:ar_rad/UtubeFrame.dart';
import 'package:ar_rad/setting.dart';
import 'package:ar_rad/youtube.dart';
import 'package:flutter/material.dart';
import 'package:ar_rad/screens/home_screen.dart';
import 'package:ar_rad/home.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home_screen(),
    YoutubeAll(),
    Setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главный',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_sharp),
            label: 'Видео',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Настройка',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(201, 190, 168, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
