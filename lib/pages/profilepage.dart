import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

String profilAd = "";
String profilSoyad = "";
String profilMail = "";

// ignore: camel_case_types
class _profilePageState extends State<profilePage> {
  CollectionReference resRef =
      FirebaseFirestore.instance.collection("loginidpass");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Hesabım", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
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
                      color: Colors.red,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontWeight:
                                                        FontWeight.bold))
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
                                                            Colors
                                                                .transparent)),
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
                          initialValue: profilAd,
                          decoration: const InputDecoration(
                            labelText: "Ad",
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
                          initialValue: profilSoyad,
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
                          initialValue:
                          profilMail,
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
                          initialValue: "31",
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
      ),
    );
  }
}

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
