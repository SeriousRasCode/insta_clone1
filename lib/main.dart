import 'package:flutter/material.dart';
import 'profile.dart';

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
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: ProfilePage(),
      
      //const MyHomePage(title: 'Flutter Demo Home Page'),
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
    {"name": "Tedros", "image": "https://i.pravatar.cc/150?u=2"},
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
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userData.length,
              itemBuilder: (context, index) {
                final user = userData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
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
                          padding: const EdgeInsets.all(
                            3.0,
                          ), 
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, 
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
                      Text(user['name']!, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),

          Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: userData.length,
            itemBuilder: (context, index) {
              final user = userData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(user['image']!),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            user['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width:8),
                          Icon(Icons.verified, size: 18, color: Colors.blue),
                          const Spacer(),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          user['image']!,
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
                        const Spacer(),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(user['name']! , style: const TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                       Icon(Icons.verified, size: 18, color: Colors.blue),
                        Text("Liked by ${user['name']} and others", style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 12),
                        SizedBox(height:8),
                        Text("View all comments", style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ],
                ),);
            },
          ),
        

       ),
         ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "" ),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: "" ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "" ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: ""),
        ],
        selectedItemColor: const Color.fromARGB(255, 146, 110, 3),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        iconSize: 30,
    ));
  }
}
