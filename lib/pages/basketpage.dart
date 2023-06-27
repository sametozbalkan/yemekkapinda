import 'package:flutter/material.dart';

class basketpage extends StatefulWidget {
  State<basketpage> createState() => _basketpageState();
}

dynamic abo;

class _basketpageState extends State<basketpage> {
  Widget build(BuildContext context) {
    abo = context;
    return basketSayfasi();
  }
}

Widget basketSayfasi() {
  return Padding(
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
  );
}

Widget sepetUrunleri(var restorantIsmi) {
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
