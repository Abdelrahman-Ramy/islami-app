import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/sebha/sebha_tab.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class Tasbeh extends StatefulWidget {
  static const String routeName = 'Tasbeh';

  Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    AzkarArgs args = ModalRoute.of(context)?.settings.arguments as AzkarArgs;
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
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.height * 0.18,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: provider.isDarkMode()
                      ? AppColors.brownColor
                      : AppColors.primaryLightColor,
                  radius: MediaQuery.of(context).size.aspectRatio * 280,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.height * 0.06,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? AppColors.brownColor
                        : AppColors.beigeColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07,
                    vertical: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    child: Icon(
                      Icons.restart_alt,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
