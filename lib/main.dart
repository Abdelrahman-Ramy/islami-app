import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:islami/sebha/azkar_masaa.dart';
import 'package:islami/sebha/azkar_noom.dart';
import 'package:islami/sebha/azkar_sabah.dart';
import 'package:islami/sebha/azkar_safer.dart';
import 'package:islami/sebha/azkar_salh.dart';
import 'package:islami/sebha/tasbeh.dart';
import 'package:provider/provider.dart';

import 'hadeth/hadeth_details_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkMode,
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        AzkarMasaa.routeName: (context) => AzkarMasaa(),
        AzkarSabah.routeName: (context) => AzkarSabah(),
        AzkarSalh.routeName: (context) => AzkarSalh(),
        AzkarSafer.routeName: (context) => AzkarSafer(),
        AzkarNoom.routeName: (context) => AzkarNoom(),
        Tasbeh.routeName: (context) => Tasbeh(),
      },
    );
  }
}
