import 'package:flutter/material.dart';

class VenmoHomeScreen extends StatelessWidget {
  const VenmoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/search_icon.png",
                            color: Color(0xff364153),
                            height: 17,
                            width: 17,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Find a person or busines',
                            style: TextStyle(
                              color: Colors.black.withValues(alpha: 0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Image.asset("assets/home_scan.png", height: 44, width: 44),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Image.asset("assets/home_disp.png"),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                children: [
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '3m',
                    description: 'Mark Adams 3',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '5m',
                    description: 'Mark Adams 2',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '5m',
                    description: 'Mark Adams 2',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '5m',
                    description: 'Mark Adams 2',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '5m',
                    description: 'Mark Adams 2',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),
                  _buildTransactionItem(
                    name: 'Lisa Forsyth paid you',
                    time: '5m',
                    description: 'Mark Adams 2',
                    amount: '+\$500.00',
                    isPositive: true,
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required String time,
    required String description,
    required String amount,
    required bool isPositive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset("assets/user.png"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isPositive
                            ? const Color(0xff68AD5E)
                            : const Color(0xFFE53935),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$time. Private transaction',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6A7282),
                      ),
                    ),
                    SizedBox(width: 12),
                    Image.asset("assets/pad.png", height: 14),
                  ],
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,

                    color: Color(0xff474343),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Image.asset("assets/love.png", height: 21),
                    SizedBox(width: 24),
                    Image.asset("assets/chat.png", height: 21),

                    Spacer(),
                    Image.asset("assets/more_icon.png", height: 26),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
