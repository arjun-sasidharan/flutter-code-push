import 'package:flutter/material.dart';
import 'package:flutter_code_push/AnimationPage.dart';
import 'package:flutter_code_push/SecondPage.dart';
import 'package:flutter_code_push/controller.dart';
import 'package:get/get.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Code Push - Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${c.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage()),
                            );
                          },
                          child: const Text("Go to Second Page")),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnimationPage()),
                            );
                          },
                          child: const Text("Go to Animation Page"))
                    ],
                  ),
                ),
              ),
              const Text(
                "version 1.0.2+1",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: c.decrementCount,
            tooltip: 'Decrement',
            child: const Icon(Icons.add),
          ),

          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: Container(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 0,
          //     horizontal: 10.0,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       FloatingActionButton(
          //         onPressed: _decrementCounter,
          //         tooltip: 'Decrement',
          //         child: const Icon(Icons.remove),
          //       ),
          //       FloatingActionButton(
          //         onPressed: _incrementCounter,
          //         tooltip: 'Increment',
          //         child: const Icon(Icons.add),
          //       )
          //     ],
          //   ),
          // ),
        );
      }
    );
  }
}
