import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islami/sebha/sebha_tab.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../providers/app_config_provider.dart';

class AzkarMasaa extends StatefulWidget {
  static const String routeName = 'AzkarMasaa';

  const AzkarMasaa({super.key});

  @override
  State<AzkarMasaa> createState() => _AzkarMasaaState();
}

class _AzkarMasaaState extends State<AzkarMasaa> {
  List azkar = [];

  Future<void> loadJson() async {
    String data =
        await rootBundle.loadString('assets/json_file/azkar_masaa.json');
    var jsonResult = json.decode(data);
    setState(() {
      azkar = jsonResult["content"];
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    AzkarArgs args = ModalRoute.of(context)?.settings.arguments as AzkarArgs;
    if (azkar.isEmpty) {
      loadJson();
    }
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
        body: azkar.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ))
            : Container(
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
                        : AppColors.beigeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var zekr = azkar[index];
                      return ListTile(
                        title: Text(
                          zekr['zekr'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: provider.isDarkMode()
                                      ? AppColors.brownColor
                                      : AppColors.beigeAvColor),
                              child: Text('التكرار: ${zekr['repeat']}',
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ),
                            if ((zekr['bless'] ?? '').isNotEmpty)
                              Text(
                                'الفضل: ${zekr['bless']}',
                                style: TextStyle(
                                    color: provider.isDarkMode()
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor),
                              ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: provider.isDarkMode()
                            ? AppColors.brownColor
                            : AppColors.primaryLightColor,
                        thickness: 2,
                      );
                    },
                    itemCount: azkar.length),
              ),
      ),
    ]);
  }
}
