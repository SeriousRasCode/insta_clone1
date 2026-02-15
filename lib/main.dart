import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 5,
        title: Text("Instagram"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outlined)),
        ],
      ),
      body: Column(
        children:[
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                color: Colors.grey[300],
                child: Column(
                  children:[
                    Row(),
                    Row()
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
