import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';
  final loginFormKey = GlobalKey<FormState>();
  bool loginSuccessful = false;
  goToHome() {
    if (loginFormKey.currentState!.validate()) {
      setState(() {
        loginSuccessful = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login_image.png'),
            SizedBox(height: 16),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Enter the username",
                          ),
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username can't be empty";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter the password",
                          ),
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius:
                        BorderRadius.circular(loginSuccessful ? 50 : 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        height: 50,
                        width: loginSuccessful ? 50 : 150,
                        child: loginSuccessful
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      onTap: () {
                        goToHome();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
