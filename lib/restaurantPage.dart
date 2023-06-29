import 'package:flutter/material.dart';
import 'package:yemekkapinda/itemInfo.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: restorantTanimi("cake", "Elmas Pastanesi",
                "Yılların değişmez lezzeti ve şehrinizde en çok tercih edilen pastane!"),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
              urunKartlari("Dalga", "31 TL", context),
            ],
          ),
        ],
      ),
    );
  }
}

Widget urunKartlari(urunIsmi, urunFiyati, context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoPage()),
        );
      },
      child: SizedBox(
        height: 80,
        width: (MediaQuery.of(context).size.width / 2) - 5,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 5,
            child: ListTile(
              title: Text(
                urunIsmi,
                style: const TextStyle(fontSize: 22, color: Colors.red),
              ),
              subtitle: Text(
                urunFiyati,
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            )),
      ));
}

Widget restorantTanimi(restorantBackground, restorantIsmi, restorantTanim) {
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$restorantBackground.jpg"),
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
                          "$restorantIsmi",
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
                            //Navigator.push(
                            //context,
                            //MaterialPageRoute(
                            // builder: (context) => BasketPage()),
                            //);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "$restorantTanim",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
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
    ],
  );
}
