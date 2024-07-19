import 'package:finalproje/features/dashboard/views/dashboard.dart';
import 'package:finalproje/features/profile/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> list = [
    Dashboard(),
    const Profile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/homeActive.svg",
            ),
            label: "Discover",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/profile_active.svg",
            ),
            label: "More",
          ),
      ],
      ),
    );
  }
}
