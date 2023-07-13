import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yemekkapinda/homePage.dart';
import 'package:yemekkapinda/registerPage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PoetsenOne-Regular'),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userCollection = FirebaseFirestore.instance.collection("loginidpass");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        navigator.push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  final mailController = TextEditingController();
  final sifreController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    sifreController.dispose();
    super.dispose();
  }

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
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
                    padding: EdgeInsets.only(bottom: 80),
                    child: Text(
                      "Yemek Kapında",
                      style: TextStyle(fontSize: 54, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 30),
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
                        signIn(context,
                            email: mailController.text,
                            password: sifreController.text);
                        const snackBar = SnackBar(
                          content: Text('Giriş yapıldı!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text(
                        'Giriş',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    children: [
                      SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 5,
                          child: Column(
                            children: [
                              const Text('Şifrenizi mi unuttunuz?'),
                              TextButton(
                                onPressed: () {
                                  //yapılacak
                                },
                                child: const Text(
                                  'Şifremi Yenile',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 5,
                          child: Column(
                            children: [
                              const Text('Yeni kullanıcı mısınız?'),
                              TextButton(
                                onPressed: () {
                                  navigator.push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                                },
                                child: const Text(
                                  'Üye Ol',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
