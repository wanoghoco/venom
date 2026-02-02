import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venom/widget/me_screen_action_container.dart';
import 'transfer_bottom_sheet.dart';

class VenmoMeScreen extends StatelessWidget {
  const VenmoMeScreen({super.key});

  static void _showTransferBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TransferBalanceBottomSheet(),
    );
  }

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
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF267ED7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 60),
                  bottomRight: Radius.elliptical(500, 60),
                ),
              ),
              child: SafeArea(
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

            // Avatar section
            Transform.translate(
              offset: const Offset(0, -60),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'ED',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(44, -40),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/qr.png",
                          height: 26,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MeScreenActionContainer(
                                image: "assets/create_group.png",
                                text: " 'Create a\ngroup'",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Wallet and Transactions tabs
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               'Wallet',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Color(0xFF333333),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 8),
                  //             Container(
                  //               height: 3,
                  //               decoration: BoxDecoration(
                  //                 color: const Color(0xFF3D95CE),
                  //                 borderRadius: BorderRadius.circular(2),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: const Text(
                  //           'Transactions',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             color: Color(0xFF999999),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //   const SizedBox(height: 24),

                  //   // Balance card
                  //   Container(
                  //     margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  //     padding: const EdgeInsets.all(24),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(16),
                  //       border: Border.all(
                  //         color: const Color(0xFFE0E0E0),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: const [
                  //             Text(
                  //               'Balance',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Color(0xFF333333),
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Text(
                  //                   'Account & Routing',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     color: Color(0xFF888888),
                  //                   ),
                  //                 ),
                  //                 SizedBox(width: 8),
                  //                 Icon(
                  //                   Icons.visibility,
                  //                   size: 20,
                  //                   color: Color(0xFF888888),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 16),
                  //         const Text(
                  //           '\$5,003',
                  //           style: TextStyle(
                  //             fontSize: 48,
                  //             fontWeight: FontWeight.w600,
                  //             color: Color(0xFF333333),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 20),
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               child: OutlinedButton(
                  //                 onPressed: () {
                  //                   VenmoMeScreen._showTransferBottomSheet(
                  //                     context,
                  //                   );
                  //                 },
                  //                 style: OutlinedButton.styleFrom(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 14,
                  //                   ),
                  //                   side: const BorderSide(
                  //                     color: Color(0xFF3D95CE),
                  //                     width: 2,
                  //                   ),
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(25),
                  //                   ),
                  //                 ),
                  //                 child: const Text(
                  //                   'Transfer',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Color(0xFF3D95CE),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(width: 12),
                  //             Expanded(
                  //               child: ElevatedButton(
                  //                 onPressed: () {},
                  //                 style: ElevatedButton.styleFrom(
                  //                   backgroundColor: const Color(0xFF3D95CE),
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 14,
                  //                   ),
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(25),
                  //                   ),
                  //                   elevation: 0,
                  //                 ),
                  //                 child: const Text(
                  //                   'Add money',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),

                  //   const SizedBox(height: 24),

                  //   // Crypto card
                  //   Container(
                  //     margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  //     padding: const EdgeInsets.all(24),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(16),
                  //       border: Border.all(
                  //         color: const Color(0xFFE0E0E0),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: const [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'Crypto',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Color(0xFF333333),
                  //               ),
                  //             ),
                  //             SizedBox(height: 8),
                  //             Text(
                  //               '\$0',
                  //               style: TextStyle(
                  //                 fontSize: 32,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Color(0xFF333333),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Icon(
                  //           Icons.arrow_forward_ios,
                  //           color: Color(0xFF888888),
                  //           size: 20,
                  //         ),
                  //       ],
                  //     ),
                  //   ),

                  //   const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
