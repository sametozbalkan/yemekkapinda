import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yemekkapinda/startPage.dart';

import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userCollection = FirebaseFirestore.instance.collection("loginidpass");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context,
      {required String ad,
      required String soyad,
      required String email,
      required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(
            ad: ad, soyad: soyad, email: email, password: password);
        navigator.push(MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _registerUser(
      {required String email,
      required String password,
      required String ad,
      required String soyad}) async {
    await userCollection
        .doc()
        .set({"email": email, "ad": ad, "soyad": soyad, "password": password});
  }

  final mailController = TextEditingController();
  final sifreController = TextEditingController();
  final adController = TextEditingController();
  final soyadController = TextEditingController();

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Yemek Kapında",
                      style: TextStyle(fontSize: 54, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: TextField(
                      controller: adController,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Ad',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : const Color.fromARGB(255, 119, 119, 119)),
                          hintText: 'Ad'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: TextField(
                      controller: soyadController,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Soyad',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : const Color.fromARGB(255, 119, 119, 119)),
                          hintText: 'Soyad'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: TextField(
                      controller: mailController,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : const Color.fromARGB(255, 119, 119, 119)),
                          hintText: 'Geçerli bir e-mail girin'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 50),
                    child: TextField(
                      controller: sifreController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Şifre',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : const Color.fromARGB(255, 119, 119, 119)),
                          hintText: 'Şifre girin'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        signUp(context,
                            ad: adController.text,
                            soyad: soyadController.text,
                            email: mailController.text,
                            password: sifreController.text);
                        const snackBar = SnackBar(
                          content: Text('Kayıt başarıyla oluşturuldu!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text(
                        'Kaydol',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Başarılı'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Kayıt başarıyla oluşturuldu!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Giriş Sayfasına Dön'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Start()));
              },
            ),
          ],
        );
      },
    );
  }
}
