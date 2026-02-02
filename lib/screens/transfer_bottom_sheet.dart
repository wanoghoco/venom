import 'package:flutter/material.dart';
import 'package:venom/widget/bottom_sheet_selector.dart';
import 'package:venom/widget/currency_input_filed.dart';
import 'account_restricted_screen.dart';

class TransferBalanceBottomSheet extends StatefulWidget {
  const TransferBalanceBottomSheet({super.key});

  @override
  State<TransferBalanceBottomSheet> createState() =>
      _TransferBalanceBottomSheetState();
}

class _TransferBalanceBottomSheetState
    extends State<TransferBalanceBottomSheet> {
  int _selectedTransferType = 1;

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
                  icon: const Icon(Icons.close, size: 24),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const Expanded(
                  child: Text(
                    'Transfer Balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1A1A1A),
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 28), // Balance the close button
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  CurrencyInputField(autofocus: true),
                  const SizedBox(height: 12),

                  const Text(
                    'Transfer up to \$5,003.00',
                    style: TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
                  ),

                  const SizedBox(height: 60),

                  Row(
                    children: [
                      Expanded(
                        child: BottomSheetSelector(
                          icons: Icons.flash_on,
                          onTap: () {
                            setState(() {
                              _selectedTransferType = 0;
                            });
                          },
                          title: 'Instant',
                          subTitle: '1.75% fee (max \$25.00)',
                          index: 0,
                          currentIndex: _selectedTransferType,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: BottomSheetSelector(
                          icons: Icons.food_bank,
                          onTap: () {
                            setState(() {
                              _selectedTransferType = 1;
                            });
                          },
                          title: '1-3 biz days ',
                          subTitle: '  NO Fee         ',
                          index: 1,
                          currentIndex: _selectedTransferType,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Transfer to section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Transfer to',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888888),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3D95CE),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Citibank  ++ 1020',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.chevron_right,
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

          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountRestrictedScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF297DD7),
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
        ],
      ),
    );
  }
}
