import 'package:flutter/material.dart';
import 'package:yemekkapinda/pages/profilePage.dart';
import 'package:yemekkapinda/restaurantPage.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

List<restorantDetay> searchRestaurant = [];
final TextEditingController abi31 = TextEditingController();

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

bool _isShow = true;
FocusNode myFocusNode = FocusNode();

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 66,
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
            onChanged: (value) => filtreliSonuclar(value),
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
                              profilKayitlari[0].adres,
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
                              tooltip: "Adres Değiştir",
                              onPressed: () {
                                _showMyDialog(context);
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
                              setState(() {
                                restorantList[0].restorantIsmiRP =
                                    searchRestaurant[index].restorantIsmi;
                              });
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

  @override
  initState() {
    searchRestaurant = myProducts;
    super.initState();
  }

  void filtreliSonuclar(String arananKelime) {
    List<restorantDetay> sonuc = [];
    if (arananKelime.isEmpty) {
      _isShow = true;
      sonuc = myProducts;
    } else {
      sonuc = myProducts
          .where((user) => user.restorantIsmi
              .toLowerCase()
              .contains(arananKelime.toLowerCase()))
          .toList();
      _isShow = false;
    }

    setState(() {
      searchRestaurant = sonuc;
    });
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adres Değiştir'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Adres giriniz:'),
                ),
                TextField(
                  controller: abi31,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: "",
                    fillColor: Colors.red,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.red
                            : const Color.fromARGB(255, 119, 119, 119)),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Değiştir'),
              onPressed: () {
                setState(() {
                  if (abi31.text == "") {
                    _showMyDialog3(context);
                  } else {
                    profilKayitlari[0].adres = abi31.text;
                    Navigator.pop(context);
                    _showMyDialog2(context);
                  }
                });
              },
            ),
            TextButton(
              child: const Text('Çık'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog2(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Başarılı'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Adres değiştirildi!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog3(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Adres kısmı boş olamaz'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
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
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(width: 0.4, color: Colors.redAccent),
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FittedBox(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  color:
                                      const Color.fromARGB(255, 255, 199, 135),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "$etiketIsmi2",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.5),
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
                              if (yildizSayisi - yildizSayisi.toInt() ==
                                  0.5) ...[
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
        ),
      ));
}
