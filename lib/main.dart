import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navitask/local_storage/shared_pref.dart';
import 'package:navitask/routes/route_pages.dart';
import 'package:navitask/routes/route_path.dart';
import 'package:navitask/themes/theme.dart';
import 'package:navitask/utils/navigator_key_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- Add this line
  await MySharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: NavigatorKeyHelper.navigatorKey,
      title: 'Flutter Demo',
      theme: CustomThemes.themeDataLight(),
      darkTheme: CustomThemes.themeDataDark(),
      themeMode: ThemeMode.system,
      getPages: RoutePages.routes,
      initialRoute: RoutePath.initial,
    );
  }
}
