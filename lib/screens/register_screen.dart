import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register() async {
    final result = await _auth.register(
      emailController.text,
      passwordController.text,
    );

    if (result == "success") {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
              decoration: InputDecoration(labelText: "Password (6+)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}