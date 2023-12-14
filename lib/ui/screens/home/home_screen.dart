import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_assests.dart';
import 'package:islamic_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppAssets.backgroundImage))),
        child: Scaffold(
          appBar: AppBar(title: const Text("Islami")),
          bottomNavigationBar: buildBottomNavBar(),
        ));
  }

  Widget buildBottomNavBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(

          selectedItemColor: AppColors.accent,
          iconSize: 34,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconQuran)),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconHadeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconSebha)),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconRadio)),
                label: "Radio")
          ],
        ),
      );
}
