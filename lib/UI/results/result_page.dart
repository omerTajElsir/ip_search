import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ip_search/models/data_model.dart';
import 'package:ip_search/theme/app_colors.dart';

import '../../generated/locale_keys.g.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.country,
    required this.ip,
    required this.cc,
    required this.onClear,
  }) : super(key: key);

  final String country;
  final String ip;
  final String cc;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 25,
            ),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/olaceholder1.json',width: 200,height: 200),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 30,),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20)),
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(LocaleKeys.yourIP ).tr(),
                            Text(ip ,style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.visible,),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10, top: 30),
                            child: Text(
                              country ,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5, top: 40),
                            child: Text(
                              "( $cc )",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),


            /// Clear button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              child: InkWell(
                onTap: onClear,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.secondary),
                  child: Center(
                    child: Text(
                      LocaleKeys.clear,
                      style: TextStyle(color: Colors.white),
                    ).tr(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
