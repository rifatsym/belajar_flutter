import 'package:flutter/material.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List menu = [
    {
      "judul": "Menu 1",
      "data": 1,
    },
    {
      "judul": "Menu 2",
      "data": 2,
    },
    {"judul": "Menu 3", "data": 3}
  ];

  late int menuAwal;
  late int index;

  @override
  void initState() {
    menuAwal = menu[0]["data"];
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Tittle"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              width: 320,
              height: 100,
              child: Center(
                child: Text(
                  "Drawer Header",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_alert),
              title: Text("Menu 1"),
            ),
            ListTile(
              leading: Icon(Icons.apartment_outlined),
              title: Text("Menu 2"),
            ),
            ListTile(
              leading: Icon(Icons.accessible_forward_outlined),
              title: Text("Menu 3"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: DropdownButton<int>(
                  value: menuAwal,
                  items: menu
                      .map((e) => DropdownMenuItem(
                            child: Text("${e['judul']}"),
                            value: e['data'] as int,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      menuAwal = value!;
                    });
                  }),
            ),
            Padding(padding: EdgeInsets.all(100.0)),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("judul SnackBar"),
                    ),
                  );
                },
                child: Text("Show SnackBar")),
            Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Ini Judul Dialog"),
                            content: Text(
                                "ini adalah isi dari dialog, anda dapat membacanya disini"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Ok"))
                            ],
                          ));
                },
                child: Text("Show Dialog")),
            Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.plus_one),
                            title: Text("Menu 1"),
                          ),
                          ListTile(
                            leading: Icon(Icons.ac_unit),
                            title: Text("Menu 2"),
                          ),
                          ListTile(
                            leading: Icon(Icons.airplanemode_off),
                            title: Text("Menu 3"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text("Show Bottom Sheet")),
            Padding(padding: EdgeInsets.all(110.0)),
            BottomNavigationBar(
                currentIndex: index,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                  ;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
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
          ],
        ),
      ),
    );
  }
}
