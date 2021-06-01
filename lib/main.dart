import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation/screens/home_screen.dart';
import 'package:meditation/screens/lessons_screen.dart';
import 'package:meditation/screens/meditation_screen.dart';
import 'package:meditation/screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens = [
    HomePage(),
    LessonScreen(),
    MeditationScreen(),
    ProfileScreen(),
  ];
  void _onPageChanged(int index) {}

  void _onItemTap(int index) {
    setState(() {
      _pageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: _pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.white24,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: _pageIndex == 0 ? Color(0xFF4A80F0) : Color(0xff89909A),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.book,
                color: _pageIndex == 1 ? Color(0xFF4A80F0) : Color(0xff89909A),
              ),
              label: 'Lessons'),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.play,
              color: _pageIndex == 2 ? Color(0xFF4A80F0) : Color(0xff89909A),
            ),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                color: _pageIndex == 3 ? Color(0xFF4A80F0) : Color(0xff89909A),
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}
