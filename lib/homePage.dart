import 'package:flutter/material.dart';
import 'package:yemekkapinda/pages/basketPage.dart';
import 'package:yemekkapinda/pages/profilePage.dart';
import 'package:yemekkapinda/pages/mainPage.dart';
import 'favoriPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemek Kapında',
      home: FutureBuilder(future: _initialization, builder: (context, snapshot){
        if(snapshot.hasError){
          return const Center(child: Text("Beklenmedik bir hata oluştu!"),);
        } else if(snapshot.hasData){
          return const MyHomePage(title: 'Yemek Kapında');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },),
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
final screens = [const mainPage(), const basketPage(), const profilePage()];

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriPage()),
                );
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
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.white, fontSize: 12))),
          child: NavigationBar(
            height: 60,
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.red,
            selectedIndex: currentIndex,
            destinations: const [
              NavigationDestination(
                label: "Restorantlar",
                icon: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                ),
              ),
              NavigationDestination(
                label: "Sepet",
                icon: Icon(Icons.shopping_basket, color: Colors.white),
              ),
              NavigationDestination(
                label: "Profil",
                icon: Icon(Icons.person_3_rounded, color: Colors.white),
              ),
            ],
            onDestinationSelected: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ));
  }
}
