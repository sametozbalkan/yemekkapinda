import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yemekkapinda/loginPage.dart';
import 'package:yemekkapinda/pages/profilePage.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const Start(),
  );
}

class Start extends StatelessWidget {
  const Start({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PoetsenOne-Regular'),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<void> isSignIn(BuildContext context,
      ) async {
    final navigator = Navigator.of(context);
    try {
        final QuerySnapshot kisiBilgileri = await FirebaseFirestore.instance
            .collection("loginidpass")
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
            .get();
        setState(() async{
          profilAd = kisiBilgileri.docs[0]["ad"].toString();
          profilSoyad = kisiBilgileri.docs[0]["soyad"].toString();
          profilMail= kisiBilgileri.docs[0]["email"].toString();
          const snackBar = SnackBar(
            content: Text('Giriş yapıldı!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          navigator.push(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                isSignIn(context);
                return HomePage();
              } else {
                return const LoginPage();
              }
            }));
  }
}
