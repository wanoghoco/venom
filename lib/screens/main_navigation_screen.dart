import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'me_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const VenmoHomeScreen(),
    const VenmoCardsScreen(),
    const VenmoPayRequestScreen(),
    const VenmoCryptoScreen(),
    const VenmoMeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: const BoxDecoration(
          color: Color(0xFF1E5FD7),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex = 2; // Navigate to Pay/Request
            });
          },
          customBorder: const CircleBorder(),
          child: const Center(
            child: Text(
              'V',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("home", 'Home', 0, size: 19),
              _buildNavItem("card", 'Cards', 1, size: 15),
              const SizedBox(width: 40),
              _buildNavItem("crypto", 'Crypto', 3, size: 26),
              _buildNavItem("me", 'Me', 4, size: 26),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String asset,
    String label,
    int index, {
    double size = 20,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/$asset.png", height: size),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: const Color(0xFF1E5FD7),

              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// PLACEHOLDER SCREENS
class VenmoCardsScreen extends StatelessWidget {
  const VenmoCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Cards Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class VenmoPayRequestScreen extends StatelessWidget {
  const VenmoPayRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pay/Request Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class VenmoCryptoScreen extends StatelessWidget {
  const VenmoCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Crypto Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
