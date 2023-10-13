// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: ListView(padding: EdgeInsets.all(20), children: [
        Padding(padding: EdgeInsets.all(20.0)),
        Image(
          image: AssetImage("asset/gambar2.png"),
          width: 100,
          height: 100,
        ),
        Center(
          child: Title(
            color: Colors.black,
            child: Text(
              "App Title",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(18.0)),
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
        Align(
          alignment: Alignment.centerRight,
          child: Text("Lupa Password?"),
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
        Padding(padding: EdgeInsets.all(190.0)),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Login",
            ),
          ]),
    );
  }
}
