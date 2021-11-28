// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "emptyTitle": "Wonna know your IP?",
  "emptyDesc": "It's easy, just click the button bellow and find out",
  "search": "Search",
  "errorTitle": "Something went wrong!",
  "errorDesc": "Please try again",
  "refresh": "refresh",
  "yourIP": "Your ip is : ",
  "clear": "clear"
};
static const Map<String,dynamic> ar = {
  "emptyTitle": "ترغب بمعرفة عنوانك؟",
  "emptyDesc": "فقط قم بضغط زر البحث ادناه",
  "search": "بحث",
  "errorTitle": "حدث خطا ما",
  "errorDesc": "الرجاء اعادة المحاوله",
  "refresh": "اعادة",
  "yourIP": "عنوانك هو : ",
  "clear": "مسح"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
