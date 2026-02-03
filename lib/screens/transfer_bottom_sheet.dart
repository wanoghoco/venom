// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:venom/widget/app_animated_loader.dart';
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
  int _selectedTransferType = 0;
  final TextEditingController controller = TextEditingController(text: '2000');
  @override
  Widget build(BuildContext context) {
    double amount = getValue();
    return Container(
      height: MediaQuery.of(context).size.height * 0.94,
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

                  CurrencyInputField(
                    autofocus: true,
                    onChange: () {
                      setState(() {});
                    },
                    controller: controller,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'Transfer up to \$5,003.00',
                    style: TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
                  ),

                  const SizedBox(height: 38),

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
                          subTitle: 'Estimated. NO Fee ',
                          index: 1,
                          currentIndex: _selectedTransferType,
                        ),
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

          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                  barrierDismissible: false,
                  barrierColor: Colors.black.withValues(alpha: 0.4),
                  context: context,
                  builder: (context) => AppAnimatedLoader(),
                );
                await Future.delayed(Duration(seconds: 3));
                Navigator.pop(context);
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
              child: Text(
                amount <= 0
                    ? 'Transfer'
                    : 'Transfer \$${(amount - ((amount * 1.7) / 100)).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getValue() {
    double value = double.tryParse(controller.text.replaceAll(",", "")) ?? 0;
    return value;
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
