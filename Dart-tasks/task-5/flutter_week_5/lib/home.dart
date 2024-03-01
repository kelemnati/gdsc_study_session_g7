import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Map<String, dynamic>> user = [];

  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();

    user = List.generate(14, (index) {
      return {
        "name": faker.person.name(),
        "design": faker.lorem.sentence(),
        "image": "assets/img${index + 1}.jpg"
      };
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics"),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {}),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              tooltip: "More options")
        ],
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: ((context, index) {
          return Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(user[index]["image"] as String),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${user[index]['name']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${user[index]['design']}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      )
                    ]),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
