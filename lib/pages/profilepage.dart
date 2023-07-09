import 'package:flutter/material.dart';
import 'package:yemekkapinda/homePage.dart';
import 'package:yemekkapinda/loginPage.dart';

// ignore: camel_case_types
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class profilBilgileri {
  String ad, soyad, email, adres;
  profilBilgileri(
      {required this.ad,
      required this.soyad,
      required this.email,
      required this.adres});
}

List<profilBilgileri> profilKayitlari = [
  profilBilgileri(
      ad: "Erce",
      soyad: "Kayapınar",
      email: "ercekayapinar@hotmail.com",
      adres: "Yıldırım Beyazıt, Çeşme Karşısı Sk., 22020 Edirne Merkez/Edirne")
];

// ignore: camel_case_types
class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: ProfileClipper(),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Profilim",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "2023 Mart'tan beri abone",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 230, 255, 91),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Sürekli Müşteri",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 199, 135),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Mahalle Muhtarı",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: <Widget>[],
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.account_balance_wallet,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Text(
                                            " Cüzdan",
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Mevcut bakiye:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("0,00 TL",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent)),
                                              onPressed: () {},
                                              child: Text(
                                                "Para ekle",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    ClipOval(
                      child: Image.asset(
                        "assets/avatar.png",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Card(
                elevation: 0,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(width: 0.1, color: Colors.black)),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Kişisel Bilgiler",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: TextFormField(
                        initialValue: 'Mustafa Erce',
                        decoration: const InputDecoration(
                          labelText: 'Ad',
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: TextFormField(
                        initialValue: 'Kayapınar',
                        decoration: const InputDecoration(
                          labelText: 'Soyad',
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: TextFormField(
                        initialValue: 'ercekayapinar@hotmail.com',
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: TextFormField(
                        initialValue: profilKayitlari[0].adres,
                        decoration: const InputDecoration(
                          labelText: 'Adres',
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 15, 5),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          _showMyDialog(context);
                        },
                        child: const Text("Hesap Değiştir",
                            style: TextStyle(color: Colors.white))))
              ],
            )
          ]),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Başarılı'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Hesaptan çıkış yapıldı!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ProfileClipper extends CustomClipper<Path> {
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
