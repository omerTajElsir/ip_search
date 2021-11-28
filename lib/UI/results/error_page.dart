import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ip_search/theme/app_colors.dart';

import '../../generated/locale_keys.g.dart';
import '../../providers/search_provider.dart';
import '../home_page.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Lottie.asset('assets/error.json',width: 200,height: 200),
        //Image(image: AssetImage('assets/error.png')),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.errorTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ).tr(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    LocaleKeys.errorDesc,
                    textAlign: TextAlign.center,
                  ).tr(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
          child: InkWell(
            onTap: () async {
              Provider.of<SearchProvider>(context, listen: false).clearSearch();
              await Provider.of<SearchProvider>(context, listen: false).getIp();

            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.secondary),
              child: Center(
                child: Text(
                  LocaleKeys.refresh,
                  style: TextStyle(color: Colors.white),
                ).tr(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
