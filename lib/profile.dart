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