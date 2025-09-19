import 'package:flutter/material.dart';
import 'package:islami/sebha/sebha_tab.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../providers/app_config_provider.dart';

class CustomAzkarTabs extends StatelessWidget {
  String nameOfAzkar;
  String nameOfTab;

  CustomAzkarTabs({required this.nameOfAzkar, required this.nameOfTab});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          nameOfTab,
          arguments: AzkarArgs(name: nameOfAzkar),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.height * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: provider.isDarkMode()
              ? AppColors.brownColor
              : AppColors.primaryLightColor,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.height * 0.4,
        child: Center(
          child: Text(
            nameOfAzkar,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: provider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
