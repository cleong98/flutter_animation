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
      home: const MyHomePage(title: 'Flutter tween Animation'),
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
  bool _isBig = false;

  void _topChange() {
    setState(() {
     _isBig = !_isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 72.0, end: _isBig ? 172.0 : 72.0),
          builder: (context, double value, child) {
            return Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child:  Center(
                //PI = 3.14

                // radian => angle
                // format = radian * 180 / PI
                //exp: 1 radian =1 * 180 / PI  = 57.3

                // angle => radian
                // format = angle * pi / 180
                // exp: 80 angle = 90 * PI / 180 = 1.57
                //   child: Transform.rotate(
                //     angle: value,
                //     child: const Text('Hi', style: TextStyle(fontSize: 50),
                //     )
                //   )
                child: Text('Hi', style: TextStyle(fontSize: value),),
              ),
            );
          },
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
