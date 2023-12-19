import 'package:flutter/material.dart';
import 'package:islamic_app/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs=[
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab()
  ];

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
          body: tabs[currentIndex],
        ));
  }

  Widget buildBottomNavBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index;
            setState(() {});
          },
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
