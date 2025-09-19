import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  String type;
  int index;

  ItemSuraName({required this.name, required this.type, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.006,
            color: provider.isDarkMode()
                ? AppColors.brownColor
                : AppColors.primaryLightColor,
          ),
          Expanded(
            child: Text(
              type,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
