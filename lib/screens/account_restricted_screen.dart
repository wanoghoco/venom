import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountRestrictedScreen extends StatelessWidget {
  const AccountRestrictedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                color: Color(0xFF267ED7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 60),
                  bottomRight: Radius.elliptical(500, 60),
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Image.asset("assets/venom.png", height: 19),
                ),
              ),
            ),
            //SafeArea
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),

                    const Text(
                      'Unusual activity detected',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    // Shield icon
                    Image.asset("assets/accout_blocked.png", height: 96),

                    SizedBox(height: size.height * 0.05),

                    // "Your account is restricted" heading
                    const Text(
                      'Your account\nis restricted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    // Description text
                    Text(
                      'Venmo has temporarily restricted your account. Please check your email for more information or contact our support team.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000).withValues(alpha: 0.6),
                        height: 1.5,
                      ),
                    ),

                    const Spacer(),

                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.05),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF267ED7),
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
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
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
