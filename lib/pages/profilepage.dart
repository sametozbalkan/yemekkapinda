import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                                height: 5,
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
                                      Container(
                                        width: 145,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Icon(Icons.stars,
                                                  color: Colors.white,
                                                  size: 20),
                                              Text(
                                                " Mahalle Muhtarı",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
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
                                            size: 27,
                                          ),
                                          Text(
                                            " Cüzdan",
                                            style: TextStyle(
                                                fontSize: 24,
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
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Row(
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
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent)),
                                              onPressed: () {},
                                              child: const Text(
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
                    side: const BorderSide(width: 0.5, color: Colors.grey)),
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
                          FirebaseAuth.instance.signOut();
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
