import 'package:flutter/material.dart';
import 'package:yemekkapinda/restaurantPage.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

// ignore: camel_case_types
class restorantDetay {
  double yildizSayisi = 0;
  String restorantIsmi, tanimlama, resim, etiketIsmi, etiketIsmi2;
  restorantDetay(
      {required this.yildizSayisi,
      required this.restorantIsmi,
      required this.tanimlama,
      required this.resim,
      required this.etiketIsmi,
      required this.etiketIsmi2});
}

final List<restorantDetay> myProducts = [
  restorantDetay(
      yildizSayisi: 4,
      restorantIsmi: "Elmas Pastanesi",
      tanimlama: "Taze ve enfes tatlılar",
      resim: "cake",
      etiketIsmi: "Taze",
      etiketIsmi2: "Muazzam"),
  restorantDetay(
      yildizSayisi: 3.5,
      restorantIsmi: "Bedesten Büfe",
      tanimlama: "Hatay usulü döner",
      resim: "doner",
      etiketIsmi: "Acılı",
      etiketIsmi2: "Yerel Lezzet"),
  restorantDetay(
      yildizSayisi: 4,
      restorantIsmi: "Taze İçecekler",
      tanimlama: "Soğuk mevye suları",
      resim: "juice",
      etiketIsmi: "Taze",
      etiketIsmi2: "Soğuk"),
  restorantDetay(
      yildizSayisi: 4.5,
      restorantIsmi: "Urfa Ev Yemekleri",
      tanimlama: "Yöresel lezzetler",
      resim: "elite",
      etiketIsmi: "Acılı",
      etiketIsmi2: "Yerel Lezzet"),
  restorantDetay(
      yildizSayisi: 2.5,
      restorantIsmi: "Meriç Döner",
      tanimlama: "Hatay usulü döner",
      resim: "doner",
      etiketIsmi: "Acılı",
      etiketIsmi2: "Yerel Lezzet"),
];

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: TextField(
            decoration: const InputDecoration(
                labelText: "Restorant ara",
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.red,
                fillColor: Colors.red,
                labelStyle: TextStyle(
                  color: Colors.red,
                )),
            onChanged: (value) => _runFilter(value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              const Padding(
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
                      "  En Çok Tercih Edilen Restorantlar",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width,
                      childAspectRatio: 4.5 / 2),
                  itemCount: searchRestaurant.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GridTile(
                      child: GestureDetector(
                        child: restorantCard(
                            searchRestaurant[index].yildizSayisi,
                            searchRestaurant[index].restorantIsmi,
                            searchRestaurant[index].tanimlama,
                            searchRestaurant[index].resim,
                            searchRestaurant[index].etiketIsmi,
                            searchRestaurant[index].etiketIsmi2,
                            context),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RestaurantPage()));
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    ));
  }

  List<restorantDetay> searchRestaurant = [];
  @override
  initState() {
    searchRestaurant = myProducts;
    super.initState();
  }

  void _runFilter(String arananKelime) {
    List<restorantDetay> sonuc = [];
    if (arananKelime.isEmpty) {
      sonuc = myProducts;
    } else {
      sonuc = myProducts
          .where((user) => user.restorantIsmi
              .toLowerCase()
              .contains(arananKelime.toLowerCase()))
          .toList();
    }

    setState(() {
      searchRestaurant = sonuc;
    });
  }
}

double x = 1;
Widget restorantCard(yildizSayisi, restorantIsmi, tanimlama, resim, etiketIsmi,
    etiketIsmi2, context) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
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
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
                SizedBox(
                  width: 60,
                  height: 83,
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
      ));
}
