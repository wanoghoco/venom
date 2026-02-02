import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'account_restricted_screen.dart';

class TransferBalanceBottomSheet extends StatefulWidget {
  const TransferBalanceBottomSheet({super.key});

  @override
  State<TransferBalanceBottomSheet> createState() =>
      _TransferBalanceBottomSheetState();
}

class _TransferBalanceBottomSheetState
    extends State<TransferBalanceBottomSheet> {
  int _selectedTransferType = 1; // 0 = Instant, 1 = Standard (1-3 biz days)

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 24, color: Colors.black),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const Expanded(
                  child: Text(
                    'Transfer Balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 24), // Balance the close button
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 32),

                  // Amount display
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\$5,003',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 20,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Transfer up to \$5,003.00',
                    style: TextStyle(fontSize: 15, color: Color(0xff1A1A1A)),
                  ),

                  const SizedBox(height: 38),

                  // Transfer type options
                  Row(
                    children: [
                      ItemWidget(
                        asset: "flash",
                        title: "Instant",
                        body: '1.75% fee (max \$25.00)',
                        currentIndex: _selectedTransferType,
                        index: 1,
                        onTap: () {
                          _selectedTransferType = 1;
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 16),
                      ItemWidget(
                        title: "1-3 Biz days",
                        body: 'No Fee\n',
                        asset: "bank",
                        currentIndex: _selectedTransferType,
                        index: 2,
                        onTap: () {
                          _selectedTransferType = 2;
                          setState(() {});
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Transfer to section
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color.fromARGB(255, 228, 228, 228),
                        ),
                      ),
                    ),

                    child: Row(
                      children: [
                        const Text(
                          'Transfer to',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF888888),
                          ),
                        ),
                        const Spacer(),
                        Image.asset("assets/bank_card.png", height: 20),
                        const SizedBox(width: 8),
                        const Text(
                          'Citibank  ++ 1020',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 181, 181, 181),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.chevron_right,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFF888888),
                          size: 24,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Disclaimer text
                  const Text(
                    'Transfer speed depends on your bank and could take up to 30 minutes, transfers are reviewed which may result in delays or funds being frozen or removed from your Venmo account.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF888888),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Transfer button
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Close bottom sheet and navigate to Account Restricted screen
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountRestrictedScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff267ED7),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Transfer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Gap(24),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function onTap;
  final String asset;
  final String title;
  final String body;
  const ItemWidget({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.title,
    required this.body,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: index == currentIndex
                  ? const Color(0xff267ED7)
                  : const Color(0xFFE0E0E0),
              width: index == currentIndex ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Image.asset("assets/$asset.png", height: 45),

              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
