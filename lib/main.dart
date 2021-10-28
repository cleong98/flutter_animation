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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _transitionAction() async {
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SlideTransition(
            position: Tween(begin: const Offset(0,-0.5), end: const Offset(0, 1))
                .chain(CurveTween(curve: const Interval(0.8, 1.0)))
                .animate(_controller),
          // position: Tween(begin: const Offset(0,-0.5), end: const Offset(0, 1))
          //     .chain(CurveTween(curve: Curves.elasticInOut))
          //     .animate(_controller),
         // scale: _controller.drive(Tween(begin: 0.5, end: 2)),
         // position: _controller.drive(Tween(begin: const Offset(0, 0), end: const Offset(0, 2))),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _transitionAction,
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}
