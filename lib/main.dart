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
      debugShowCheckedModeBanner: false,
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

  final List<Map<String, String>> userData = [
    {"name": "Ruth", "image": "https://i.pravatar.cc/150?u=1"},
    {"name": "Moa", "image": "https://i.pravatar.cc/150?u=2"},
    {"name": "I B", "image": "https://i.pravatar.cc/150?u=3"},
    {"name": "Bruk", "image": "https://i.pravatar.cc/150?u=4"},
    {"name": "Ezana", "image": "https://i.pravatar.cc/150?u=5"},
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 5,
        title: Text("Instagram", style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline)),
        ],
      ),
      body:Column(
  children: [
    SizedBox(
      height: 110, // Adjusted height to fit text below circle
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userData.length,
        itemBuilder: (context, index) {
          final user = userData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.red, Colors.purple],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0), // The "border" thickness
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Gap between ring and image
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(user['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  user['name']!,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    ),

    SizedBox(
      height:310,
       // Adjusted height to fit text below circle
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: userData.length,
        itemBuilder: (context, index) {
          final user = userData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:[
                      Container(
                        width:40,
                        height:40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(user['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(user['name']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Expanded(child: Container()), 
                      Icon(Icons.more_horiz),
                    ]
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children:[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            height: 500,
                            user['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),

                        ),
                      ),
                  ]
                ),
                SizedBox(height: 10),
                Row(),
              ],
            ),
          );
        },
      ),
    ),
     
  ],
),
    );
  }
}
