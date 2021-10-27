import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Curve'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0;

  void _topChange() {
    setState(() {
      _top += 300;
      if(_top > 300) _top = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedPadding(
        duration: const Duration(seconds: 1),
        padding: EdgeInsets.only(top: _top),
        // we can using curves to control which curve we want it.
        curve: Curves.bounceIn,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _topChange,
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}
