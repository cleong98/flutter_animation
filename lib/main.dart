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
      home: const MyHomePage(title: 'Flutter Animated Switcher'),
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
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          duration: const Duration(seconds: 2),
          child: _isSwitch
          ? Text('Hi', key: UniqueKey(), style: TextStyle(fontSize: 100),)
          : Text('Halo', key: UniqueKey(), style: TextStyle(fontSize: 100),),
          // child: _isSwitch
          //   ? const Center(
          //     child: CircularProgressIndicator(),
          //   )
          //   : Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'),
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
