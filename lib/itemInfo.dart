import 'package:flutter/material.dart';
import 'package:yemekkapinda/restaurantPage.dart';
import 'homePage.dart';
import 'package:yemekkapinda/pages/basketPage.dart';

int quantity = 1;
int total = 0;
String restorantIsmiInfo = "";

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InfoPageState createState() => _InfoPageState();
}

class urunBilgileri {
  String urunAdi;
  int urunFiyati;
  urunBilgileri({required this.urunAdi, required this.urunFiyati});
}

List<urunBilgileri> urunSayfasi = [
  urunBilgileri(urunAdi: "urunAdi", urunFiyati: 0)
];

class _InfoPageState extends State<InfoPage> {
  final yourScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.2, 0.0),
                        colors: [
                          Colors.red,
                          Color.fromARGB(247, 253, 37, 37),
                        ],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                urunSayfasi[0].urunAdi,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36),
                              ),
                              IconButton(
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
                                          builder: (context) => HomePage()));
                                },
                              ),
                            ],
                          ),
                        ),
                        itemCake(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ((MediaQuery.of(context).size.width - 175) / 2),
                      top: (MediaQuery.of(context).size.height + 175) / 5),
                  child: Hero(
                    tag: "cakeitemcoe",
                    child: ClipOval(
                      child: Image.asset(
                        "assets/cake.jpg",
                        fit: BoxFit.cover,
                        width: 175,
                        height: 175,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(250),
                        ),
                        width: 100,
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(250),
                                ),
                                child: GestureDetector(
                                  onTap: remove,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(250),
                                ),
                                child: GestureDetector(
                                  onTap: add,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Toplam tutar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("₺$total",
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: FloatingActionButton(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Sepete Ekle",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              if (eklenenList.isEmpty |
                                  restorantIsmi.contains(restorantIsmiInfo)) {
                                for (var i = 0; i < quantity; i++) {
                                  eklenenList.add(restorantUrunleri(
                                      urunIsmi: urunSayfasi[0].urunAdi,
                                      urunFiyati: urunSayfasi[0].urunFiyati));
                                }
                                restorantIsmi = restorantIsmiInfo;
                                final snackBar = SnackBar(
                                  content:
                                      const Text('Başarıyla sepete eklendi!'),
                                  action: SnackBarAction(
                                    label: 'Sepete Git',
                                    onPressed: () {
                                      setState(() {
                                        currentIndex = 1;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                _showMyDialog2(context);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        child: Text(
                          "Bunlara da göz atın:",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: ListView.separated(
                  controller: yourScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          "assets/cake.jpg",
                                          fit: BoxFit.fill,
                                          width: 192,
                                        )),
                                  ],
                                )),
                            const Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Kakaolu Kek",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, bottom: 5),
                                      child: Row(
                                        children: [Text("31 TL")],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void add() {
    setState(() {
      quantity = quantity + 1;
      total = urunSayfasi[0].urunFiyati * quantity;
    });
  }

  void remove() {
    setState(() {
      if (quantity > 1) {
        quantity = quantity - 1;
        total = urunSayfasi[0].urunFiyati * quantity;
      }
    });
  }

  Future<void> _showMyDialog2(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Sepette başka bir restoranta ait ürünler var. Kaldırıp devam etmek ister misiniz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kaldır ve Ekle'),
              onPressed: () async {
                setState(() {
                  currentIndex = 1;
                });
                eklenenList.clear();
                for (var i = 0; i < quantity; i++) {
                  eklenenList.add(restorantUrunleri(
                      urunIsmi: urunSayfasi[0].urunAdi,
                      urunFiyati: urunSayfasi[0].urunFiyati));
                }
                restorantIsmi = restorantIsmiInfo;
                final snackBar = SnackBar(
                  content: const Text('Başarıyla sepete eklendi!'),
                  action: SnackBarAction(
                    label: 'Sepete Git',
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Geri Dön'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Sepete Git'),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            )
          ],
        );
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget itemCake() {
  var adamci = urunSayfasi[0].urunFiyati;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(
        height: 15,
      ),
      Text(
        restorantIsmiInfo,
        style: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 173, 30, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Yeni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 199, 135),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Pasta ve Tatlı",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "₺$adamci",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              const Text(
                "adet başına",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: Colors.white),
              )
            ],
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          Icon(Icons.star, size: 15, color: Colors.orangeAccent),
          Icon(Icons.star, size: 15, color: Colors.orangeAccent),
          Icon(Icons.star, size: 15, color: Colors.orangeAccent),
          Icon(Icons.star, size: 15, color: Colors.orangeAccent),
          Icon(Icons.star_half, size: 15, color: Colors.orangeAccent),
        ],
      ),
    ],
  );
}
