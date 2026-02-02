import 'package:flutter/material.dart';

class AccountRestrictedScreen extends StatelessWidget {
  const AccountRestrictedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(backgroundColor: Color(0xff297DD7)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 110,
              decoration: const BoxDecoration(
                color: Color(0xff297DD7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 60),
                  bottomRight: Radius.elliptical(500, 60),
                ),
              ),
              child: Center(child: Image.asset("assets/venom.png", height: 18)),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),

                    const Text(
                      'Unusual activity detected',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: size.height * 0.06),

                    // Shield icon
                    Image.asset("assets/warning.png", height: 92),

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
                        fontSize: 15,
                        color: Color.fromARGB(255, 68, 68, 68),
                        height: 1.5,
                      ),
                    ),

                    const Spacer(),

                    // Contact Support button
                    Container(
                      height: 86,
                      padding: EdgeInsets.only(bottom: size.height * 0.05),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff297DD7),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
