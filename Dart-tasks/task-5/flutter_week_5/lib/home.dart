import 'package:flutter/material.dart';

class UserInfomation {
  final String name;
  final String message;
  final String timestamp;
  final String profilePicture;
  final int messageCount;

  UserInfomation(this.name, this.message, this.timestamp, this.profilePicture,
      this.messageCount);
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<UserInfomation> userInformation = [
    UserInfomation('Naty', 'Where you at?', '16:35', 'assets/img.jpg', 0),
    UserInfomation('Glenn', 'I am coming to the festival where shall we meet?',
        '16:32', 'assets/img1.jpg', 1),
    UserInfomation(
        'Casey',
        'Just finished reading that article you recommended - fascinating stuff!',
        '16:26',
        'assets/img2.jpg',
        1),
    UserInfomation(
        'Tim',
        "Coffee break? ☕️ I'm craving some sunshine and a chat!",
        '16:20',
        'assets/img3.jpg',
        2),
    UserInfomation(
        'Chris',
        "Forgot to tell you - I saw the coolest street art downtown today! ",
        '16:00',
        'assets/img4.jpg',
        3),
    UserInfomation(
        'Patty',
        "Got any weekend plans? Maybe we could catch a movie or explore that new park? ",
        '14:54',
        'assets/img5.jpg',
        1),
    UserInfomation(
        'Kate',
        "Feeling a bit overwhelmed with deadlines. Any tips for staying productive? ️",
        '13:38',
        'assets/img6.jpg',
        0),
    UserInfomation(
        'Morgan',
        "Guess what? I finally mastered that recipe you shared! You have to try it sometime. ‍",
        '9:45',
        'assets/img7.jpg',
        3),
    UserInfomation(
        'Jarad',
        "Random thought: What would be your dream superpower? ⚡️",
        'Sat',
        'assets/img8.jpg',
        0),
    UserInfomation(
        'Mackenzie',
        "Just discovered a hidden gem of a coffee shop! ☕️✨ You have to check it out! ️",
        'Sat',
        'assets/img9.jpg',
        2),
    UserInfomation(
        'Horton',
        "Feeling grateful for our friendship! Thanks for always being there for me. ",
        'Fri',
        'assets/img10.jpg',
        5),
    UserInfomation(
        'Dom',
        "Sending good vibes your way! ✨ Hope you have an amazing day! ",
        'Fri',
        'assets/img11.jpg',
        1),
    UserInfomation('Morris', 'Where you at?', 'Fri', 'assets/img12.jpg', 1),
    UserInfomation(
        'Chirstie', 'Yeah, cya later🙋‍♂️', 'Thu', 'assets/img13.jpg', 1),
    UserInfomation('Jacobs', 'Nope!', 'Tue', 'assets/img14.jpg', 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: userInformation.length,
        itemBuilder: (context, index) {
          return buildUser(userInformation[index]);
        },
      ),
    );
  }
}

Widget buildUser(UserInfomation userInfomation) {
  return Card(
    margin: const EdgeInsets.all(4),
    child: ListTile(
        leading: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 29,
            backgroundImage: Image.asset(userInfomation.profilePicture).image,
          ),
        ),
        title: Text(
          userInfomation.name,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        subtitle: Text(
          userInfomation.message,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        trailing: Column(
          children: [
            Text(
              userInfomation.timestamp,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            const SizedBox(height: 15),
            if (userInfomation.messageCount > 0)
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Text(
                  userInfomation.messageCount.toString(),
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              )
          ],
        )),
  );
}
