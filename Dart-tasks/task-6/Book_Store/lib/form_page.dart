import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .40,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/book_store.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "GDSC BOOK STORE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Enter your name"),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                  return "Please enter a valid name";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Enter Email"),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value!)) {
                                  return "Please enter valid email address";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Enter Phone number"),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    RegExp(r'^(\+251|251|0)?[1-9]\d{8}$')
                                        .hasMatch(value!)) {
                                  return "Please enter valid phone number";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 151, 56, 30),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushNamed(
                                          context, "/bookDetails");
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(Icons.arrow_forward,
                                        size: 40,
                                        color:
                                            Color.fromARGB(255, 151, 56, 30)),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
