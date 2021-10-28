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
      home: const MyHomePage(title: 'Flutter counter demo'),
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
  int _counter = 0;

  void _counterIncrement() async {

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          // color: Colors.blue,
          child: AnimatedCounter(value: _counter, duration: const Duration(seconds: 1),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterIncrement,
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class AnimatedCounter extends StatelessWidget {
  final int value;
  final Duration duration;
  const AnimatedCounter({Key? key, required this.value, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<double>(end: value.toDouble()),
      builder: (context, double value, child) {
        final whole = value ~/ 1;
        final decimal = value - whole;

        return Stack(
          children: [
            Positioned(
              top: -100 * decimal, // 0-> -100
              child: Opacity(
                opacity: 1.0 - decimal,
                child: Text(
                  "$whole",
                  style: const TextStyle(fontSize: 100),
                ),
              ),
            ),
            Positioned(
              top: 100 - decimal * 100, // 100 -> 0
              child: Opacity(
                opacity: decimal,
                child: Text(
                  "${whole + 1}",
                  style: const TextStyle(fontSize: 100),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
