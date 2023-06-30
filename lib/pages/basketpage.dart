import 'package:flutter/material.dart';
import 'package:yemekkapinda/homePage.dart';
import 'package:yemekkapinda/restaurantPage.dart';

// ignore: camel_case_types
class basketPage extends StatefulWidget {
  const basketPage({super.key});

  @override
  State<basketPage> createState() => _basketPageState();
}

dynamic abo;

final List<restorantUrunleri> eklenenList = [];

// ignore: camel_case_types
class _basketPageState extends State<basketPage> {
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    abo = context;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Visibility(
            visible: _isShow,
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
                                      icon: const Icon(Icons.cancel,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _isShow = !_isShow;
                                        });
                                      },
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
        eklenenList.isNotEmpty
            ? ListView(shrinkWrap: true, children: [
                Card(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(restorantIsmi,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red, size: 24),
                          onPressed: () {
                            setState(() {
                              eklenenList.removeRange(0, eklenenList.length);
                            });
                          },
                        ),
                      ),
                    ]),
                    GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 6.5),
                        itemCount: eklenenList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GridTile(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 80,
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        5,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        elevation: 5,
                                        child: ListTile(
                                          title: Text(
                                            eklenenList[index].urunIsmi,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.red),
                                          ),
                                          subtitle: Text(
                                            eklenenList[index].urunFiyati,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                          ),
                                          trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      eklenenList
                                                          .removeAt(index);
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      eklenenList
                                                          .removeAt(index);
                                                    });
                                                  },
                                                )
                                              ]),
                                        )),
                                  )));
                        }),
                  ]),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 220,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.not_accessible,
                              size: 36,
                            ),
                            Text(
                              "Sepetiniz boş",
                              style: TextStyle(fontSize: 28),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
      ]),
    );
  }
}

String restorantIsmi = "";

Widget urunKartlari(urunIsmi, fiyat, context) {
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
