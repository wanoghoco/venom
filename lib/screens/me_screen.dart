import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:venom/widget/crypto_card.dart';
import 'package:venom/widget/me_balance_card.dart';
import 'package:venom/widget/me_screen_action_container.dart';
import 'package:venom/widget/me_selector.dart';
import 'package:venom/widget/username_widget.dart';

class VenmoMeScreen extends StatefulWidget {
  const VenmoMeScreen({super.key});

  @override
  State<VenmoMeScreen> createState() => _VenmoMeScreenState();
}

class _VenmoMeScreenState extends State<VenmoMeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.05;

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
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xff267ED7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(500, 60),
                      bottomRight: Radius.elliptical(500, 60),
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Emys Duroseau-Purnell',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Image.asset(
                                  "assets/expand_more.png",
                                  color: Colors.white,
                                  height: 5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/not_bell.png",
                                    color: Color(0xFF267ED7),
                                    height: 21,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/setting.png",
                                    color: Color(0xFF267ED7),
                                    height: 21,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '@EEDuroseau',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                Positioned(bottom: -60, child: UsernameWidget()),
              ],
            ),
            Gap(size.height * 0.1),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 0),
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MeScreenActionContainer(
                              image: "assets/create_group.png",
                              text: "Create a group",
                            ),
                          ),
                          Gap(20),
                          Expanded(
                            child: MeScreenActionContainer(
                              image: "assets/friends.png",
                              text: "13 friends",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        height: 55,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color(0xffF1F1F1).withValues(alpha: 0.4),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: MeSelector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                                text: "Wallet",
                                index: 0,
                                currentIndex: currentIndex,
                              ),
                            ),
                            Expanded(
                              child: MeSelector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                },
                                text: "Transactions",
                                index: 1,
                                currentIndex: currentIndex,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      MeBalanceCard(),
                      const SizedBox(height: 24),
                      CryptoCard(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
