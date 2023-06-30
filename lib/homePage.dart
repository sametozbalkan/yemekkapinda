import 'package:flutter/material.dart';
import 'package:yemekkapinda/pages/basketPage.dart';
import 'package:yemekkapinda/pages/profilePage.dart';
import 'package:yemekkapinda/pages/mainPage.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemek Kapında',
      home: MyHomePage(title: 'Yemek Kapında'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<MyHomePage> {
  static final screens = [
    const mainPage(),
    const basketPage(),
    const profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.app_registration_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              //Navigator.push(
              // context,
              //  MaterialPageRoute(builder: (context) => FavoriPage()),
              //);
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text("Yemek Kapında"),
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 37,
            fontFamily: 'PoetsenOne-Regular'),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          showSelectedLabels: true,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          unselectedFontSize: 10.0,
          selectedFontSize: 12.0,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                label: "Restorantlar",
                icon: Icon(Icons.restaurant),
                tooltip: "Restorantlar"),
            BottomNavigationBarItem(
              label: "Sepet",
              icon: Icon(Icons.shopping_basket),
              tooltip: "Sepet",
            ),
            BottomNavigationBarItem(
              label: "Profil",
              icon: Icon(Icons.person_3_rounded),
              tooltip: "Profil",
            ),
          ]),
    );
  }
}
