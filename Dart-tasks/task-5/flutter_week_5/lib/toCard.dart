import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Card(
          color: Colors.white,
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ListTile(
              leading: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 29,
                  backgroundImage: Image.asset('assets/img1.jpg').image,
                ),
              ),
              title: const Text(
                'Kylie',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              subtitle: const Text(
                'Hello this is Kylie from Providence, Rhode Island...thanks for accepting me',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
