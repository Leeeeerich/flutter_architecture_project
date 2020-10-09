import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_project/src/ui/home/first_chat/first_chat_screen.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text(FlutterI18n.translate(ctx, "home_title"))),
      body: _screens()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: I18nText("first_chat_title")),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: I18nText("home_title")),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: I18nText("home_title")),
        ],
      ),
    );
  }

  List<Widget> _screens() => [
        FirstChatScreen(),
        FirstChatScreen(),
        FirstChatScreen(),
      ];
}
