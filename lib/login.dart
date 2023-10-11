// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: ListView(padding: EdgeInsets.all(20), children: [
        TextField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            label: Text("Email"),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          autocorrect: false,
          obscureText: isHidden,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.key),
            suffixIcon: IconButton(
              onPressed: () {
                if (isHidden == true) {
                  isHidden = false;
                } else {
                  isHidden = true;
                }
                setState(() {});
              },
              icon: Icon(Icons.remove_red_eye),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            label: Text("Password"),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
        ),
      ]),
    );
  }
}
