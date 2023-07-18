import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yemekkapinda/pages/basketPage.dart';
import 'package:yemekkapinda/pages/profilePage.dart';
import 'package:yemekkapinda/pages/mainPage.dart';
import 'favoriPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(home: HomePage(),),
  );
}

class HomePage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
        '/profil': (context) => const profilePage(),
        },
      debugShowCheckedModeBanner: false,
      title: 'Yemek Kapında',
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Beklenmedik bir hata oluştu!"),
            );
          } else if (snapshot.hasData) {
            return const MyHomePage(title: 'Yemek Kapında');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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
String adamke="";

final screens = [const mainPage(), const basketPage(), const MyFavoriPage()];

class _HomePageState extends State<MyHomePage> {
  String? _currentAddress;
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState(){
    _getCurrentPosition();
    super.initState();
  }

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
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              onPressed: ()  {
                Navigator.pushNamed(context, '/profil');
              },
            ),
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
                label: "Favoriler",
                icon: Icon(Icons.favorite, color: Colors.white),
              ),
            ],
            onDestinationSelected: (value) {
              setState(() {
                if(value==0){
                  adamke=_currentAddress ?? "";
                }
                currentIndex = value;
              });
            },
          ),
        ));
  }
}
