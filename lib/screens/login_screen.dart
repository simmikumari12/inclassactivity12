import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final result = await _auth.login(
      emailController.text,
      passwordController.text,
    );

    if (result == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                );
              },
              child: Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}