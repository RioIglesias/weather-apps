import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home_page/home_page.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen>
    with TickerProviderStateMixin {
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[Icons.location_on, Icons.menu];

  @override
  void initState() {
    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 0),
      vsync: this,
    );
    super.initState();
  }

  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) {
          switch (_bottomNavIndex) {
            case 0:
              return const HomePage();
            case 1:
              return const HomePage();

            default:
              return const HomePage();
          }
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,

        splashSpeedInMilliseconds: 0,
        backgroundGradient: LinearGradient(
          colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
          transform: GradientRotation(300),
          begin: AlignmentGeometry.xy(1, 9),
          end: AlignmentGeometry.xy(2, 1),
        ),
        hideAnimationController: _hideBottomBarAnimationController,

        // notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
