import 'package:flutter/material.dart';

// ignore: camel_case_types
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

dynamic abo;

// ignore: camel_case_types
class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return profilSayfasi();
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

Widget profilSayfasi() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(
              clipper: ProfileClipper(),
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
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Expanded(
                            flex: 19,
                            child: Text(
                              "Profilim",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Row(
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text("Hesap Değiştir",
                                          style: TextStyle(color: Colors.red)))
                                ],
                              )),
                        ],
                      ),
                    ),
                    profileGenel(),
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
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  initialValue: 'Mustafa Erce',
                  maxLength: 30,
                  decoration: const InputDecoration(
                    labelText: 'Ad',
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                    //suffixIcon: Icon(
                    //  Icons.check_circle,
                    //),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: TextFormField(
                  initialValue: 'Kayapınar',
                  maxLength: 30,
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
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: TextFormField(
                  initialValue: 'ercekayapinar@hotmail.com',
                  maxLength: 50,
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
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: TextFormField(
                  initialValue:
                      "Yıldırım Beyazıt Mah, Çeşme Karşısı Sk, No: 22, Merkez/Edirne",
                  maxLength: 100,
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
        ),
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 15, 5),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 120,
                    height: 35,
                    child: const Center(
                        child: Text("Hesabı Güncelle",
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
              )
            ],
          )
        ]),
      ],
    ),
  );
}

Widget profileGenel() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(
        height: 15,
      ),
      const Text(
        "2023 Mart'tan beri abone",
        style: TextStyle(
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
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 255, 91),
                  borderRadius: BorderRadius.circular(10),
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
                  color: const Color.fromARGB(255, 255, 199, 135),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Mahalle Muhtarı",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
  );
}
