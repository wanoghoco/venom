import 'package:flutter/material.dart';

class AccountRestrictedScreen extends StatelessWidget {
  const AccountRestrictedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Blue header with Venmo logo
            Container(
              width: double.infinity,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                color: Color(0xFF3D95CE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 60),
                  bottomRight: Radius.elliptical(500, 60),
                ),
              ),
              child: Center(
                child: Text(
                  'venmo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width < 375 ? 48 : 56,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),

                    // "Unusual activity detected" text
                    const Text(
                      'Unusual activity detected',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),

                    SizedBox(height: size.height * 0.06),

                    // Shield icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF3D95CE).withOpacity(0.1),
                      ),
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF3D95CE),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Shield background
                              Icon(
                                Icons.shield,
                                size: 70,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              // Exclamation mark
                              const Icon(
                                Icons.priority_high,
                                size: 50,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    // "Your account is restricted" heading
                    const Text(
                      'Your account\nis restricted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF333333),
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    // Description text
                    const Text(
                      'Venmo has temporarily restricted your account. Please check your email for more information or contact our support team.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF666666),
                        height: 1.5,
                      ),
                    ),

                    const Spacer(),

                    // Contact Support button
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.05),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle contact support
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3D95CE),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Contact Support',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
