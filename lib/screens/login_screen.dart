import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:venom/widget/app_textfild.dart';
import 'main_navigation_screen.dart';

class VenmoLoginScreen extends StatefulWidget {
  const VenmoLoginScreen({super.key});

  @override
  State<VenmoLoginScreen> createState() => _VenmoLoginScreenState();
}

class _VenmoLoginScreenState extends State<VenmoLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFF267ED7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 30),
                    bottomRight: Radius.elliptical(200, 30),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Gap(38),
                      Image.asset("assets/venom.png", height: 16),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: size.height * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(size.height * 0.05),
                    AppTextfild(
                      controller: _usernameController,
                      labelText: 'Email, phone, or username',
                    ),
                    Gap(24),
                    AppTextfild(
                      controller: _passwordController,
                      labelText: "Password",
                    ),

                    SizedBox(height: size.height * 0.04),

                    InkWell(
                      onTap: _handleLogin,
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF267ED7),
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.025),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: const Color(0xFF5B8FB7),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: const Color(0xFF5B8FB7),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
}
