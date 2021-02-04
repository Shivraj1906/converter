import 'package:converter/Convert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller = TextEditingController();
  String text = "";

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void calculateAnswer(String expression) {
    setState(() {
      Convert calculate = new Convert();

      this.text = calculate.convert(expression);
    });
  }

  void click() {
    calculateAnswer(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polish Notation Converter"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter the String",
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(child: Text("Prefix"), onPressed: () {}),
              RaisedButton(
                child: Text("Postfix"),
                onPressed: this.click,
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Center(
                child: Text(
                  this.text,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
