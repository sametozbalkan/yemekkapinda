import 'package:flutter/material.dart';
import 'package:yemekkapinda/homePage.dart';
import 'package:yemekkapinda/restaurantPage.dart';

// ignore: camel_case_types
class basketPage extends StatefulWidget {
  const basketPage({super.key});

  @override
  State<basketPage> createState() => _basketPageState();
}

final List<restorantUrunleri> eklenenList = [];

// ignore: camel_case_types
class _basketPageState extends State<basketPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
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
                          var adamke = eklenenList[index].urunFiyati;
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
                                            "$adamke",
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
                                                      eklenenList.add(
                                                          restorantUrunleri(
                                                              urunIsmi:
                                                                  eklenenList[
                                                                          index]
                                                                      .urunIsmi,
                                                              urunFiyati:
                                                                  eklenenList[
                                                                          index]
                                                                      .urunFiyati));
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
              ])
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 120,
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
