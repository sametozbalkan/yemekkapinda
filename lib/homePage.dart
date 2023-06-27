import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'restaurantPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Yemek Kapında',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Main(),
      '/restaurantPage': (context) => const RestaurantPage(),
    },
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

double yildizSayisi = 0.0;
dynamic abo;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    abo = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.app_registration_rounded,
            size: 30,
          ),
          onPressed: () {},
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              //Navigator.push(
              // context,
              //  MaterialPageRoute(builder: (context) => FavoriPage()),
              //);
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text("Yemek Kapında"),
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 37,
            fontFamily: 'PoetsenOne-Regular'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "Restorantlar",
              icon: Icon(Icons.home),
              tooltip: "Restorantlar"),
          BottomNavigationBarItem(
            label: "Sepet",
            icon: Icon(Icons.shopping_basket),
            tooltip: "Sepet",
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person_3_rounded),
            tooltip: "Profil",
          ),
        ],
      ),
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.all(5),
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
                abo,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
          GestureDetector(
            child: restorantCard(4.0, "  Taze İçecekler  ",
                "Soğuk mevye suları", "juice", "Taze", "Soğuk"),
            onTap: () {
              Navigator.push(
                abo,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
          GestureDetector(
            child: restorantCard(3.5, "Urfa Ev Yemekleri", "Yöresel lezzetler",
                "elite", "Acılı", "Yerel Lezzet"),
            onTap: () {
              Navigator.push(
                abo,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
          GestureDetector(
            child: restorantCard(3.5, "    Meriç Döner    ",
                "Hatay usulü döner", "doner", "Acılı", "Yerel Lezzet"),
            onTap: () {
              Navigator.push(
                abo,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Visibility(
              visible: true,
              child: Card(
                color: Colors.redAccent,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Wrap(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 9,
                                      child: Text(
                                        "Burada sepetine eklediklerini düzenleyebilir veya çıkarabilirsin. Sepete birden çok ekleme yapabilirsin ancak tek bir restoranttan sipariş verebilirsin!",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        icon: Icon(Icons.cancel,
                                            color: Colors.white),
                                        onPressed: () {},
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(children: [
                  sepetUrunleri("Elmas Pastanesi"),
                  sepetUrunleri("Bedesten Döner"),
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 150,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text("Sepeti Onayla",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    SingleChildScrollView(
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
                              flex: 7,
                              child: Text(
                                "Profilim",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: const Text("Hesap Değiştir",
                                            style:
                                                TextStyle(color: Colors.red)))
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
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                        child: const Text("Hesabı Güncelle",
                            style: TextStyle(color: Colors.white))),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static Widget sepetUrunleri(var restorantIsmi) {
    return Card(
      color: const Color.fromARGB(255, 243, 243, 243),
      child: Column(children: [
        Row(children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Text("$restorantIsmi",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 24),
              onPressed: () {},
            ),
          ),
        ]),
        Wrap(
          children: [
            urunKartlari("Açma", "31 TL", abo),
            urunKartlari("Açma", "31 TL", abo),
            urunKartlari("Açma", "31 TL", abo),
          ],
        ),
      ]),
    );
  }

  static Widget urunKartlari(urunIsmi, fiyat, context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width - 12,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                urunIsmi,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              subtitle: Text(
                fiyat,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                    ),
                    color: Colors.red,
                    onPressed: () {}),
              ),
            );
          },
        ),
      ),
    );
  }

  static double x = 1;
  static Widget restorantCard(
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
}

int _selectedIndex = 0;

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
