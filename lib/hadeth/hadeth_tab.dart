import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth/item_hadeth_name.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../providers/app_config_provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    loadHadethFile();
    return Column(
      children: [
        Image.asset('assets/images/hadith_header-1x.png'),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.brownColor
              : AppColors.primaryLightColor,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.brownColor
              : AppColors.primaryLightColor,
          thickness: 2,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? AppColors.brownColor
                          : AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                        hadeth: Hadeth(
                            title: ahadethList[index].title,
                            content: ahadethList[index].content));
                  },
                  itemCount: ahadethList.length,
                ),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n'); // split all ahadeth
      String title = hadethLines[0]; // first line(name of hadeth)
      hadethLines.removeAt(0); // show content
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

/// data class
class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
