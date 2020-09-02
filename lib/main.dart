import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String content;
  var _height = TextEditingController();
  var _weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _height,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(hintText: '身高'),
            ),
            TextField(
              controller: _weight,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(hintText: '體重'),
            ),
            Text(content ?? ''),
            RaisedButton(
              onPressed: () {
                print(_height.text);
                var h = double.parse(_height.text) / 100.0;
                var w = double.parse(_weight.text);
                var bmi = w / (h * h);
                setState(() {
                  content = 'bmi = $bmi';
                });
              },
              child: Text('計算'),
            ),
          ],
        ),
      ),
    );
  }
}
