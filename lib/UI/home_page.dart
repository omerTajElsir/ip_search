import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ip_search/UI/results/empty_page.dart';
import 'package:ip_search/UI/results/error_page.dart';
import 'package:ip_search/UI/results/result_page.dart';
import 'package:ip_search/providers/search_provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColorDark,
          Theme.of(context).primaryColorLight
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () async {
                        if(context.locale==context.supportedLocales[0]){
                          await context.setLocale(context.supportedLocales[1]);
                        }else{
                          await context.setLocale(context.supportedLocales[0]);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 14),
                          child: Text(
                              context.locale==context.supportedLocales[0]
                                  ? "عربي"
                                  : "EN",
                        ),
                      ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 14),
                          child: Icon(
                              Provider.of<ThemeProvider>(context).darkTheme
                                  ? Icons.wb_sunny
                                  : Icons.nights_stay),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                /// Body: Changing status between Empty,searching and result
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Provider.of<SearchProvider>(context, listen: true).error!=null ?ErrorPage():Provider.of<SearchProvider>(context, listen: true).response == null &&
                          !Provider.of<SearchProvider>(context, listen: true).isSearching &&
                      Provider.of<SearchProvider>(context, listen: true).error == null
                      ? EmptyPage()
                      : Provider.of<SearchProvider>(context, listen: true).isSearching
                          ? Container(
                              height: MediaQuery.of(context).size.height - 150,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Lottie.asset('assets/loader1.json'),
                                  ),
                                ],
                              ),
                            )
                          : Provider.of<SearchProvider>(context, listen: true).response != null
                              ? ResultPage(
                                  ip: Provider.of<SearchProvider>(context, listen: false).response!.ip,
                                  country: Provider.of<SearchProvider>(context, listen: false).response!.country,
                                  cc: Provider.of<SearchProvider>(context, listen: false).response!.cc,
                                  onClear: () {
                                    Provider.of<SearchProvider>(context, listen: false).clearSearch();
                                  },
                                )
                              : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
