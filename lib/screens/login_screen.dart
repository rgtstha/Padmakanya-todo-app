import 'package:flutter/material.dart';
import 'package:flutter_form/screens/home_screen.dart';
import 'package:flutter_form/widgets/todo_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordObsecured = true;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!value.contains('@')) {
                    return "Invalid email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isPasswordObsecured,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObsecured = !isPasswordObsecured;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be greater than 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              TodoElevatedButton(
                text: "Login",
                onPressed: () {
                  bool valid = _formKey.currentState!.validate();

                  if (valid) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
