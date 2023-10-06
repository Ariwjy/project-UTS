import 'package:flutter/material.dart';
import 'package:project_uts/Authentication/signup.dart';
import 'package:project_uts/Screen/main_screen.dart';
import 'package:project_uts/data/user_data.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  bool isLoginButtonEnabled = false;
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    emailText.addListener(updateLoginButtonState);
    passwordText.addListener(updateLoginButtonState);
  }

  void updateLoginButtonState() {
    setState(() {
      final username = emailText.text;
      final password = passwordText.text;
      isLoginButtonEnabled = username.isNotEmpty && password.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("Images/logo1.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: emailText,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Username",
                  hintText: "Username",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              ),
              TextField(
                controller: passwordText,
                keyboardType: TextInputType.text,
                obscureText:
                    !isPasswordVisible, // Menggunakan isPasswordVisible untuk mengatur apakah password tersembunyi atau tidak
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                  suffixIcon: togglePassword(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: isLoginButtonEnabled
                    ? () {
                        UserData.username = emailText.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => MainScreen()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  "Don't have an Account? Register Here",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => SignUpScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        icon: isPasswordVisible
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: Colors.grey);
  }
}
