import 'package:flutter/material.dart';
import 'package:islamic_app/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppAssets.backgroundImage))),
        child: Scaffold(
          appBar: AppBar(title:  Text(AppLocalizations.of(context)!.islami)),
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
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconHadeth)),
                label: AppLocalizations.of(context)!.ahadith),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.iconRadio)),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ],
        ),
      );
}
