import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  final passwordController = TextEditingController();

  void logout(BuildContext context) async {
    await _auth.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  void changePassword(BuildContext context) async {
    final result = await _auth.changePassword(passwordController.text);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(result!)));
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.getCurrentUser();

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Logged in as: ${user?.email}"),
            SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "New Password"),
            ),

            ElevatedButton(
              onPressed: () => changePassword(context),
              child: Text("Update Password"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => logout(context),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}