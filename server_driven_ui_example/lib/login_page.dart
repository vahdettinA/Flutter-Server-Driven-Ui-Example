import 'package:flutter/material.dart';

typedef WidgetBuilderFunc = Widget Function(Map<String, dynamic> json);

final Map<String, WidgetBuilderFunc> widgetRegistry = {
  "text": (json) => Text(
    json["value"] ?? "",
    style: TextStyle(
      fontSize: (json["style"]?["fontSize"] ?? 14.0).toDouble(),
      fontWeight: json["style"]?["fontWeight"] == "bold"
          ? FontWeight.bold
          : FontWeight.normal,
      color: json["style"]?["color"] != null
          ? Color(json["style"]["color"])
          : Colors.black,
    ),
  ),
  "textfield": (json) => TextField(
    obscureText: json["obscure"] ?? false,
    decoration: InputDecoration(hintText: json["hint"] ?? ""),
  ),
  "button": (json) => ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: json["isSecondary"] == true ? Colors.grey : Colors.blue,
    ),
    child: Text(json["title"] ?? ""),
  ),
  "column": (json) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: (json["children"] as List)
        .map<Widget>((child) => parseWidget(child))
        .toList(),
  ),
};
Widget parseWidget(Map<String, dynamic> json) {
  final type = json["type"];
  final builder = widgetRegistry[type];

  if (builder != null) {
    return builder(json);
  }

  return const SizedBox.shrink(); // Bilinmeyen tipler için fallback
}

final List<Map<String, dynamic>> serverUi = [
  {
    "type": "column",
    "children": [
      {
        "type": "text",
        "value": "Welcome Back!",
        "style": {"fontSize": 28.0, "fontWeight": "bold"},
      },
      {
        "type": "text",
        "value": "Please login to continue",
        "style": {"fontSize": 16.0, "color": 0xFF888888},
      },
      {"type": "textfield", "hint": "Email"},
      {"type": "textfield", "hint": "Password", "obscure": true},
      {"type": "button", "title": "Login"},
      {"type": "button", "title": "Register", "isSecondary": true},
    ],
  },
];

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: parseWidget(serverUi.first),
      ),
    );
  }
}
