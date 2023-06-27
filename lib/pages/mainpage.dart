import 'package:flutter/material.dart';
import 'package:yemekkapinda/restaurantPage.dart';

class mainPage extends StatefulWidget {
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: restorantSayfa(context),
    );
  }
}

Widget restorantSayfa(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
    child: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        const Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.restaurant,
                    size: 24,
                    color: Colors.red,
                  ),
                  Text(
                    " En Çok Tercih Edilen Restorantlar",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
          ],
        ),
        //GestureDetector(
        //  child: restorantCard(4, "Elmas Pastanesi", "Taze ve enfes tatlılar",
        //      "cake", "Taze", "Muazzam"),
        //  onTap: () {
        //   Navigator.pushNamed(abo, "/restaurantPage",
        //        arguments: detayRestorant("Allahu", "Ekber"));
        //  },
        //),
        GestureDetector(
          child: restorantCard(3.5, " Bedesten Büfe ", "Hatay usulü döner",
              "doner", "Acılı", "Yerel Lezzet"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RestaurantPage()),
            );
          },
        ),
        GestureDetector(
          child: restorantCard(4.0, "  Taze İçecekler  ", "Soğuk mevye suları",
              "juice", "Taze", "Soğuk"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RestaurantPage()),
            );
          },
        ),
        GestureDetector(
          child: restorantCard(3.5, "Urfa Ev Yemekleri", "Yöresel lezzetler",
              "elite", "Acılı", "Yerel Lezzet"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RestaurantPage()),
            );
          },
        ),
        GestureDetector(
          child: restorantCard(3.5, "    Meriç Döner    ", "Hatay usulü döner",
              "doner", "Acılı", "Yerel Lezzet"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RestaurantPage()),
            );
          },
        ),
      ],
    ),
  );
}

double x = 1;
Widget restorantCard(
    yildizSayisi, restorantIsmi, tanimlama, resim, etiketIsmi, etiketIsmi2) {
  return Card(
    color: const Color.fromARGB(255, 243, 243, 243),
    child: FittedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    " $restorantIsmi ",
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
                  children: <Widget>[
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "$etiketIsmi",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9.5,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 68,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 199, 135),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "$etiketIsmi2",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 9.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Puan",
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
                      " $yildizSayisi",
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 7,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 90,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  fit: BoxFit.fill,
                  alignment: Alignment.topRight,
                  image: AssetImage('assets/$resim.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
