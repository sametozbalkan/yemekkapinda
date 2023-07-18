import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yemekkapinda/restaurantPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yemekkapinda/homePage.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

bool _isShow = true;
FocusNode myFocusNode = FocusNode();

class _mainPageState extends State<mainPage> {
  void restorantEkle() async {
    FirebaseFirestore.instance.collection("restorants").add({
      "id": 5,
      "resim": "doner",
      "restorantIsmi": "abi",
      "tanimlama": "yokke",
      "yildizSayisi": 2.5
    });
  }

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

  String name = "";
  @override
  Widget build(BuildContext context) {
    CollectionReference resRef =
        FirebaseFirestore.instance.collection("restorants");
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 72,
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              border: const OutlineInputBorder(),
              labelText: "Yakınındaki restorantları ara",
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.red,
              fillColor: Colors.red,
              labelStyle: TextStyle(
                  color: myFocusNode.hasFocus
                      ? Colors.red
                      : const Color.fromARGB(255, 119, 119, 119)),
            ),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          bottom: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.house,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Ev",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              adamke,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent),
                        child: FittedBox(
                          child: IconButton(
                              tooltip: "Adresi Yenile",
                              onPressed: () {
                                _getCurrentPosition();
                                adamke= _currentAddress ?? "";
                              },
                              icon: const Icon(
                                Icons.change_circle,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            //ElevatedButton(onPressed: (){restorantEkle();}, child: Text("Ekle")),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Visibility(
                      visible: _isShow,
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.restaurant,
                              size: 28,
                              color: Colors.red,
                            ),
                            Text(
                              "  En Çok Tercih Edilen Restorantlar",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      )),
                  Visibility(
                      visible: !_isShow,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              size: 28,
                              color: Colors.red,
                            ),
                            Text(
                              " Arama Sonuçları",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      )),
                  StreamBuilder<QuerySnapshot>(
                      stream: resRef.snapshots(),
                      builder: (BuildContext context, snapshot) {
                        return snapshot.hasData && snapshot.data != null
                            ? GridView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                                  if (name.isEmpty) {
                                    return GridTile(
                                      child: GestureDetector(
                                        child: restorantCard(
                                            data["yildizSayisi"],
                                            data["restorantIsmi"],
                                            data["tanimlama"],
                                            data["resim"],
                                            context),
                                        onTap: () {
                                          setState(() {
                                            restorantList[0].restorantIsmiRP =
                                                data["restorantIsmi"];
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RestaurantPage()));
                                        },
                                      ),
                                    );
                                  }
                                  if (data["restorantIsmi"]
                                      .toString()
                                      .toLowerCase()
                                      .startsWith(name.toLowerCase())) {
                                    return GridTile(
                                      child: GestureDetector(
                                        child: restorantCard(
                                            data["yildizSayisi"],
                                            data["restorantIsmi"],
                                            data["tanimlama"],
                                            data["resim"],
                                            context),
                                        onTap: () {
                                          setState(() {
                                            restorantList[0].restorantIsmiRP =
                                                data["restorantIsmi"];
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RestaurantPage()));
                                        },
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent:
                                            MediaQuery.of(context).size.width,
                                        childAspectRatio: 4.5 / 1.6),
                              )
                            : const Center(child: CircularProgressIndicator());
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}

double x = 1;
Widget restorantCard(yildizSayisi, restorantIsmi, tanimlama, resim, context) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(width: 1, color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.615,
                  child: FittedBox(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            "$restorantIsmi",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.red),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$tanimlama",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 9.5,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Puan ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 7,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            for (x = 1; x <= yildizSayisi; x++) ...[
                              const Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.orangeAccent,
                              ),
                            ],
                            if (yildizSayisi - yildizSayisi.toInt() == 0.5) ...[
                              const Icon(
                                Icons.star_half,
                                size: 10,
                                color: Colors.orangeAccent,
                              ),
                            ],
                            for (x = 1; x <= 5 - yildizSayisi; x++) ...[
                              const Icon(
                                Icons.star_border,
                                size: 10,
                                color: Colors.orangeAccent,
                              ),
                            ],
                            Text(
                              "$yildizSayisi",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 7,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: FittedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 1.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              image: AssetImage('assets/$resim.jpg'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ));
}
