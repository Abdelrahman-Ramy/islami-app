import 'package:flutter/material.dart';
import 'package:islami/hadeth/item_hadeth_details.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../providers/app_config_provider.dart';
import 'hadeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadethDetailsScreen';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(
                  content: args.content[index],
                );
              },
              itemCount: args.content.length,
            )),
      ),
    ]);
  }
}
