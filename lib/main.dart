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
      home: const MyHomePage(title: 'Flutter Animated Container'),
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
  double _side = 100;

  void _sideChange() {
    setState(() {
      _side = _side > 200 ? 100 : _side + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _side,
          height: _side,
          decoration: BoxDecoration(
            // change color animated
            //color: _side > 200 ? Colors.red : Colors.blue,
            gradient: LinearGradient(
              colors: const [Colors.orange, Colors.white],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              //change gradient change position
              stops: [(_side / 1000) * 2, 0.9],
            ),
            // make sure always circle
            borderRadius: BorderRadius.circular(_side / 2),
            boxShadow: const [BoxShadow(spreadRadius: 5, blurRadius: 15)],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sideChange,
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}
