// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuncdating/controllers/auth_controller.dart';
import 'package:tuncdating/views/screens/auth/screens/screens.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "Welcome to TuncDating",
                style: headerStyle(size: 30),
              ),
              Image.asset(
                'assets/logo.png',
                width: 300,
                height: 300,
              ),
              Text(
                "Login now\nTo find your best match",
                textAlign: TextAlign.center,
                style: headerStyle(size: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTField(
                  labelText: "Email",
                  textEditingController: emailController,
                  iconData: Icons.email,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTField(
                  labelText: "Password",
                  textEditingController: passwordController,
                  iconData: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showPB = true;
                        });
                        await AuthenticationController()
                            .loginUser(
                                passwordController: passwordController,
                                emailController: emailController)
                            .whenComplete(() => setState(() {
                                  showPB = false;
                                }));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 170, vertical: 10),
                      ),
                      child: showPB
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.red[900]!),
                            )
                          : Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.red[900],
                                  ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RegistrationScreen.routeName);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Create Here",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle headerStyle({required double size}) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: size);
  }
}
