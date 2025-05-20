import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieflix/components/button/primary_button.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
      theme: ThemeData.dark(), // tema escuro
    ),
  );
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Signup> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            TextField(
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(Icons.email, color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.person, color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              obscureText: _obscureText,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.green),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 10),
            Text("Inactive", style: TextStyle(color: Colors.white70)),

            SizedBox(height: 30),

            PrimaryButton(onPressed: () {}, text: "Create Account"),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () => context.go('/signin'),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Color(0xFF95ACFF)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
