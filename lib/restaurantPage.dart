import 'package:flutter/material.dart';
import 'package:yemekkapinda/homePage.dart';
import 'package:yemekkapinda/itemInfo.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RestaurantPageState createState() => _RestaurantPageState();
}

// ignore: camel_case_types
class restorantUrunleri {
  String urunIsmi;
  int urunFiyati;
  restorantUrunleri({required this.urunIsmi, required this.urunFiyati});
}

final List<restorantUrunleri> sepetDurumu = [
  restorantUrunleri(urunIsmi: "Dalga1", urunFiyati: 31),
  restorantUrunleri(urunIsmi: "Dalga2", urunFiyati: 32),
  restorantUrunleri(urunIsmi: "Dalga3", urunFiyati: 33),
  restorantUrunleri(urunIsmi: "Dalga4", urunFiyati: 34),
];

// ignore: camel_case_types
class restorantTanimi {
  String restorantBackground, restorantIsmiRP, restorantTanim;
  restorantTanimi(
      {required this.restorantBackground,
      required this.restorantIsmiRP,
      required this.restorantTanim});
}

final List<restorantTanimi> restorantList = [
  restorantTanimi(
      restorantBackground: "cake",
      restorantIsmiRP: "Elmas Pastanesi",
      restorantTanim:
          "Yılların değişmez lezzeti ve şehrinizde en çok tercih edilen pastane!")
];
var a = restorantList[0].restorantBackground;

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/$a.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.7),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.2, 0.0),
                      colors: [
                        Colors.redAccent,
                        Colors.redAccent,
                      ],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Text(
                                    restorantList[0].restorantIsmiRP,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.shopping_basket,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        currentIndex = 1;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            Text(
                              restorantList[0].restorantTanim,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "İşte restoranın en çok tercih edilenleri:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2.6),
                itemCount: sepetDurumu.length,
                itemBuilder: (BuildContext ctx, index) {
                  var isim = sepetDurumu[index].urunFiyati;
                  return GridTile(
                      child: GestureDetector(
                          onTap: () {
                            restorantIsmiInfo =
                                restorantList[0].restorantIsmiRP;
                            urunSayfasi[0].urunAdi =
                                sepetDurumu[index].urunIsmi;
                            urunSayfasi[0].urunFiyati =
                                sepetDurumu[index].urunFiyati;
                            total = sepetDurumu[index].urunFiyati;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InfoPage()),
                            );
                          },
                          child: SizedBox(
                            height: 100,
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 5,
                                child: ListTile(
                                  title: Text(
                                    sepetDurumu[index].urunIsmi,
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.red),
                                  ),
                                  subtitle: Text(
                                    "$isim TL",
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                )),
                          )));
                }),
          )
        ],
      ),
    );
  }
}
