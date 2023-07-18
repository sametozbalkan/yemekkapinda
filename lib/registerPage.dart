import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        const snackBar = SnackBar(
          content: Text('Kayıt başarıyla oluşturuldu!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on FirebaseAuthException catch (e) {
      var snackBar = SnackBar(
        content: Text(e.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  final TextEditingController mailController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();
  final TextEditingController sifreController2 = TextEditingController();
  final TextEditingController adController = TextEditingController();
  final TextEditingController soyadController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    sifreController.dispose();
    sifreController2.dispose();
    adController.dispose();
    soyadController.dispose();
    super.dispose();
  }

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height-120,
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
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 50),
                    child: TextField(
                      controller: sifreController2,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Şifreyi Onayla',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : const Color.fromARGB(255, 119, 119, 119)),
                          hintText: 'Şifreyi tekrar girin'),
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
                        if(sifreController.text==sifreController2.text){
                          signUp(context,
                              ad: adController.text,
                              soyad: soyadController.text,
                              email: mailController.text,
                              password: sifreController.text);
                        } else {
                          const snackBar = SnackBar( backgroundColor: Colors.red, elevation: 0,
                            content: Text('Şifreler farklı!', style: TextStyle(color: Colors.white, fontSize: 14),),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
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
}
