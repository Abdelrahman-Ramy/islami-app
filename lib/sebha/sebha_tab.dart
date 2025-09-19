// import 'package:flutter/material.dart';
// import 'package:islami/app_colors.dart';
//
// class SebhaTab extends StatefulWidget {
//
//   SebhaTab({super.key});
//
//   @override
//   State<SebhaTab> createState() => _SebhaTabState();
// }
//
// class _SebhaTabState extends State<SebhaTab> {
//   int counter = 0;
//   int index = 0;
//   double turns = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 270),
//                 child: Image.asset(
//                     'assets/images/head of seb7a.png'),
//               ),
//               AnimatedRotation(
//                 turns: turns,
//                 duration:Duration(milliseconds: 70),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 35,
//                     vertical: 35
//                   ),
//                   child: Image.asset(
//                       'assets/images/body of seb7a-1x.png',),
//                 ),
//               ),
//             ],
//           ),
//           Text('عدد التسبيحات',
//           style: Theme.of(context).textTheme.bodyLarge,),
//           SizedBox(
//             height: MediaQuery.of(context).size.height*0.04,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: Color(0xffc8b395),
//             ),
//             height: MediaQuery.of(context).size.height*0.09,
//             width: MediaQuery.of(context).size.height*0.08,
//             child: Center(
//               child: Text( '$counter',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height*0.03,
//           ),
//           InkWell(
//             onTap: (){
//               setState(() {
//
//               });
//               counter++;
//               turns += 1;
//               if(counter == 33){
//                 counter = 0;
//                 azkar[index];
//                 index++;
//                 if(index == 3){
//                   index =  0;
//                 }
//               }
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: AppColors.primaryLightColor
//               ),
//               height: MediaQuery.of(context).size.height*0.07,
//               width: MediaQuery.of(context).size.height*0.2,
//               child: Center(
//                 child: Text(
//                   azkar[index],
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: AppColors.whiteColor
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// List<String> azkar = [
//   'سبحان الله',
//   'الحمد الله',
//   'الله اكبر',
// ];

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/sebha/azkar_noom.dart';
import 'package:islami/sebha/azkar_safer.dart';
import 'package:islami/sebha/azkar_salh.dart';
import 'package:islami/sebha/tasbeh.dart';

import 'azkar_masaa.dart';
import 'azkar_sabah.dart';
import 'custom_azkar_tabs.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.01,
        vertical: MediaQuery.of(context).size.width * 0.18,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAzkarTabs(
              nameOfAzkar: 'اذكار الصباح',
              nameOfTab: AzkarSabah.routeName,
            ),
            CustomAzkarTabs(
              nameOfAzkar: 'اذكار المساء',
              nameOfTab: AzkarMasaa.routeName,
            ),
            CustomAzkarTabs(
              nameOfAzkar: 'اذكار بعد الصلاة المفروضة',
              nameOfTab: AzkarSalh.routeName,
            ),
            CustomAzkarTabs(
              nameOfAzkar: 'اذكار السفر',
              nameOfTab: AzkarSafer.routeName,
            ),
            CustomAzkarTabs(
              nameOfAzkar: 'اذكار النوم',
              nameOfTab: AzkarNoom.routeName,
            ),
            CustomAzkarTabs(
              nameOfAzkar: 'تسبيح',
              nameOfTab: Tasbeh.routeName,
            ),
          ],
        ),
      ),
    );
  }
}

class AzkarArgs {
  String name;

  AzkarArgs({required this.name});
}
