import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFavoriPage extends StatefulWidget{
  const MyFavoriPage({super.key});

  @override
  State<MyFavoriPage> createState() => _FavoriPageState();
}

// ignore: camel_case_types
class _FavoriPageState extends State<MyFavoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Center(child: Column(children: [
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
        ])));
  }
}
