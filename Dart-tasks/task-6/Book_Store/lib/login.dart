// A simple login application

import 'bookStore.dart';
import 'package:flutter/material.dart';
import 'styledButton.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC Book Store',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  final Color color = const Color.fromARGB(255, 151, 56, 30);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/book.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'GDSC BOOK STORE',
                style: TextStyle(
                    color: widget.color,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Login into Your Account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value == "") {
                    return "This field is required!";
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  if (_emailController.text == "gdsc" &&
                      _passwordController.text == "1234") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BookStore()));
                  }
                }
              },
              child: const Button(name: 'Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 17, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 17,
                  )),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: const Text('Sign Up',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
