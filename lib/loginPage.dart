import 'package:flutter/material.dart';
import 'package:yemekkapinda/homePage.dart';

void main() {
  runApp(const Login());
}

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
  late TextEditingController mailController;
  late TextEditingController sifreController;
  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    sifreController = TextEditingController();
  }

  @override
  void dispose() {
    mailController.dispose();
    sifreController.dispose();
    super.dispose();
  }

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
                        if (mailController.text == "admin" &&
                            sifreController.text == "123") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>  HomePage()));
                        } else {
                          _showMyDialog(context);
                        }
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
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 15),
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
                                onPressed: () {},
                                child: const Text(
                                  'Üye Ol',
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 15),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 100),
                  const Text("use admin 123")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hata'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('E-mail veya şifre yanlış!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
