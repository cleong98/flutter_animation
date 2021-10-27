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
      home: const MyHomePage(title: 'Flutter Animated Cross Fade'),
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
  bool _isSwitch = false;

  void _switchChanged() {
    setState(() {
      _isSwitch = !_isSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedCrossFade(
          crossFadeState: _isSwitch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
          firstChild: const Text('Hi', style: TextStyle(fontSize: 100),),
          secondChild: const Text('Halo', style: TextStyle(fontSize: 100),),
          firstCurve: Curves.easeOutQuad,
          secondCurve: Curves.easeInQuad,
          sizeCurve: Curves.bounceInOut,
          layoutBuilder: (topChild, topChildkey, bottomChild, bottomChildKey) {
            return Stack(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              children: [
                Positioned(
                  key: bottomChildKey,
                  top: 0,
                  child: bottomChild,
                ),
                Positioned(
                  key: topChildkey,
                  child: topChild,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchChanged,
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}
