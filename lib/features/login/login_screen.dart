import 'package:flutter/material.dart';
import 'package:digital_news/core/router/routes.dart';
import 'package:digital_news/core/components/custom_text_field.dart';
import 'package:digital_news/core/components/custom_password_field.dart';
import 'package:digital_news/core/components/custom_button.dart';
import 'package:digital_news/core/components/app_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              const Center(child: AppLogo(height: 100, width: 100)),
              const SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' to our \nNews Blog',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text('Please enter your details'),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email',
                hintText: 'Your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Your password',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (val) {
                      setState(() {
                        _rememberMe = val ?? false;
                      });
                    },
                  ),
                  const Text('Remember me'),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.home);
                },
              ),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
