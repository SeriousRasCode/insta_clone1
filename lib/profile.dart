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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                const SizedBox(width: 8),
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
              ],
            ),
          ),
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