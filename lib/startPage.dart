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
    isSignIn(context);
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

Future<void> isSignIn(BuildContext context,
      ) async {
    try {
        final QuerySnapshot kisiBilgileri = await FirebaseFirestore.instance
            .collection("loginidpass")
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
            .get();
         profilAd = kisiBilgileri.docs[0]["ad"].toString();
          profilSoyad = kisiBilgileri.docs[0]["soyad"].toString();
          profilMail= kisiBilgileri.docs[0]["email"].toString();
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return const LoginPage();
              }
            }));
  }
}
