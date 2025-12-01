import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> serverUi = [
    {
      "type": "Text",
      "title": "Hoş Geldiniz",
      "fontSize": 26.0,
      "color": Colors.black,
    },
    {
      "type": "Text",
      "title": "Lütfen giriş yapın",
      "fontSize": 16.0,
      "color": Colors.grey,
    },
    {"type": "TextField", "hint": "E-mail", "color": Colors.blue},
    {"type": "TextField", "hint": "Password", "color": Colors.red},
    {
      "type": "Button",
      "height": 50,
      "color": Colors.blue,
      "title": "Giriş Yap",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> ui = [];

    for (var item in serverUi) {
      switch (item["type"]) {
        case "Text":
          ui.add(
            Text(
              item["title"],
              style: TextStyle(
                fontSize: item["fontSize"] ?? 18.0,
                color: item["color"] ?? Colors.black,
              ),
            ),
          );
          break;

        case "TextField":
          ui.add(
            TextField(
              decoration: InputDecoration(
                hintText: item["hint"],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: item["color"]),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: item["color"], width: 2),
                ),
              ),
            ),
          );
          break;

        case "Button":
          ui.add(
            SizedBox(
              height: item["height"] ?? 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: item["color"]),
                onPressed: () {},
                child: Text(item["title"]),
              ),
            ),
          );
          break;
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            ...ui.map(
              (w) =>
                  Padding(padding: const EdgeInsets.only(bottom: 16), child: w),
            ),
          ],
        ),
      ),
    );
  }
}
