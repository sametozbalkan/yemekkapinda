import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yemekkapinda/loginPage.dart';
import 'package:yemekkapinda/registerPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PoetsenOne-Regular'),
      debugShowCheckedModeBanner: false,
      home: const StartPage(
        title: 'Yemek Kapında',
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

final screens1 = [const LoginPage(), const RegisterPage()];
int currentIndex = 0;

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: screens1[currentIndex]);
  }
}
