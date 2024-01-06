import 'package:flutter/material.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late SettingsProvider provider;

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(provider.isLightMode()
                    ? AppAssets.backgroundImage
                    : AppAssets.darkBackgroundImage))),
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.islami)),
          bottomNavigationBar: buildBottomNavBar(),
          body: tabs[currentIndex],
        ));
  }

  Widget buildBottomNavBar() => Theme(
        data: Theme.of(context).copyWith(
            canvasColor: provider.isLightMode()
                ? AppColors.primary
                : AppColors.darkPrimary),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          selectedItemColor:
              provider.isLightMode() ? AppColors.accent : AppColors.darkAccent,
          // iconSize: 34,
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.iconQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.iconHadeth)),
                label: AppLocalizations.of(context)!.ahadith),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.iconSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(AppAssets.iconRadio)),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ],
        ),
      );
}
