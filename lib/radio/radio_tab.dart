import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio@1x.png.png'),
        const SizedBox(
          height: 35,
        ),
        Text(
          'إذاعة القرآن الكريم',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              color: provider.isDarkMode()
                  ? AppColors.brownColor
                  : AppColors.primaryLightColor,
              size: 45,
            ),
            SizedBox(
              width: 55,
            ),
            Icon(
              Icons.play_arrow,
              color: provider.isDarkMode()
                  ? AppColors.brownColor
                  : AppColors.primaryLightColor,
              size: 60,
            ),
            SizedBox(
              width: 55,
            ),
            Icon(
              Icons.skip_next,
              color: provider.isDarkMode()
                  ? AppColors.brownColor
                  : AppColors.primaryLightColor,
              size: 45,
            ),
          ],
        )
      ],
    );
  }
}
