import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/settings/language_bottom_sheet.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.07,
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 28),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: provider.isDarkMode()
                    ? AppColors.brownColor
                    : AppColors.beigeColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 28),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: provider.isDarkMode()
                    ? AppColors.brownColor
                    : AppColors.beigeColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
