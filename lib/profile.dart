import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Map<String, dynamic> profileData = const {
    "username": "seriousras",
    "name": "Tedros Teshome",
    "bio": "Artist | Developer",
    "description": "የአንበሳው መንፈስ ከኔጋራ ነው፤",
    "link": "github.com/SeriousRasCode",
    "posts": 8,
    "followers": 335,
    "following": 435,
    "profilePic": "https://i.pravatar.cc/150?u=2",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              profileData["username"],
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body:ListView(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profileData["profilePic"]),
                ),
                MyStatColumn(profileData["posts"].toString(), "Posts"),
                MyStatColumn(profileData["followers"].toString(), "Followers"),
                MyStatColumn(profileData["following"].toString(), "Following"),
              ],
            ),
          ),

          // My Bio 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileData["name"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(profileData["bio"]),
                Text(profileData["description"]),
                Text(
                  profileData["link"],
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Edit Pro,Share Btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.black, fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: const Text("Share Profile", style: TextStyle(color: Colors.black, fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: const Text("Contact", style: TextStyle(color: Colors.black, fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 110, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profileData.length,
              itemBuilder: (context, index) {
                final user = profileData[index];
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
                                    image: NetworkImage(user['profilePic']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Tab
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.grid_on),
              ),
              Icon(Icons.video_collection_outlined, color: Colors.grey),
              Icon(Icons.person_pin_outlined, color: Colors.grey),
            ],
          ),
          const Divider(height: 1, thickness: 1),

          // Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profileData["posts"],
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey[200],
                child: Image.network(
                  "https://picsum.photos/id/${index + 20}/300/300",
                  fit: BoxFit.cover,
                ),
              );
            },
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
    )

    );
  }

  // Reusable COmponent For Stats part I have
  Column MyStatColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}