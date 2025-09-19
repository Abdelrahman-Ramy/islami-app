import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth/hadeth_tab.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/quran_tab.dart';
import 'package:islami/radio/radio_tab.dart';
import 'package:islami/sebha/sebha_tab.dart';
import 'package:islami/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              'assets/images/home_dark_background-1x.png')
          : Image.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              'assets/images/bg3.png'),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.azkar,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 28,
                ),
                label: AppLocalizations.of(context)!.settings,
              )
            ],
          ),
        ),
        body: tabs[selectedIndex],
      )
    ]);
  }
}

List<Widget> tabs = [
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  SettingsTab(),
];