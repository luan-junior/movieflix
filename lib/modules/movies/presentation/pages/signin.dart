import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieflix/components/button/primary_button.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signin(),
      theme: ThemeData.dark(), // tema escuro
    ),
  );
}

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Signin> {
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
              'Login',
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

            PrimaryButton(onPressed: () => context.go('/home'), text: "Login"),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Haven’t made an account?",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () => context.go('/signup'),
                  child: Text(
                    "Sign Up",
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
