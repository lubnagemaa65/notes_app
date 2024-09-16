import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/models/themes.dart';

import 'app/routes/app_pages.dart';

void main()async {
   await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Notes Application",
      initialRoute: AppPages.INITIAL,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: Themes().getThemeMode(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
