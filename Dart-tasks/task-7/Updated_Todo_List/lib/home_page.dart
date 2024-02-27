import 'package:flutter/material.dart';
import 'package:gdsc_1/form_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          decoration: BoxDecoration(color: Colors.red[400]),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Displaying an image with color filtering
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.red[400]!,
                  BlendMode.modulate,
                ),
                child: Image.asset(
                  "resource/stick.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              // Button to navigate to the form page
              ElevatedButton(
                onPressed: () {
                  // Using Get to navigate to FormPage with a fade transition
                  Get.to(() => const FormPage(),
                      transition: Transition.fade,
                      duration: const Duration(seconds: 2));
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
