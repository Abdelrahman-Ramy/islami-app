import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../providers/app_config_provider.dart';
import 'item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
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
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: args.name == "الفاتحه"
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: provider.isDarkMode()
                                  ? AppColors.brownColor
                                  : AppColors.primaryLightColor,
                              thickness: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ItemSuraDetails(
                              content: verses[index],
                              index: index,
                            );
                          },
                          itemCount: verses.length,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\n',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: provider.isDarkMode()
                                      ? AppColors.brownColor
                                      : AppColors.primaryLightColor,
                                  thickness: 2,
                                );
                              },
                              itemBuilder: (context, index) {
                                return ItemSuraDetails(
                                  content: verses[index],
                                  index: index,
                                );
                              },
                              itemCount: verses.length,
                            ),
                          )
                        ],
                      )),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

/// data class
class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
