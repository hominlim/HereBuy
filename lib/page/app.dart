import 'package:carrot_test/page/MyInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        // return MyFavoriteContents();
        return MyInformation();
        break;
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child:
              SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22.0),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 22.0),
        ),
        label: label);
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        // selectedItemColor: Colors.red,
        selectedFontSize: 12.0,
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("location", "생활"),
          _bottomNavigationBarItem("notes", "등록"),
          _bottomNavigationBarItem("chat", "채팅"),
          _bottomNavigationBarItem("user", "내정보"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
