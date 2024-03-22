import 'package:flutter/material.dart';
import 'package:new_task/bonus_screen.dart';

import 'package:new_task/game_home.dart';
import 'package:new_task/game_screen.dart';
import 'package:new_task/help_screen.dart';
import 'package:new_task/play.dart';
import 'package:new_task/premium_screen.dart';
import 'package:new_task/resumetracking_screen.dart';
import 'package:new_task/startpage.dart';
import 'package:new_task/task_line_screen.dart';
import 'package:new_task/utils/web.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initOneSignal();
  String check = await fetchButtonLinks('buttonlinks');
  if (check != "0") {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // fetchData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 98, 42, 71),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      routes: {
        "/gamehome": (context) => const GameHome(),
        "/": (context) => const StartPg(),
        "/startpg": (context) => const StartPg(),
        "/play": (context) => const PlayScreen(),
        "/taskline": (context) => const TaskLineScreen(),
        "/bonus": (context) => const BounsScreen(),
        "/game": (context) => const GameScreen(),
        "/premium": (context) => const PremiumScreen(),
        "/help": (context) => const HelpScreen(),
        "/tracking": (context) => const ResumeTrackingScreen(),
      },
    );
  }
}

void initOneSignal() {
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("0aee07dd-fa8b-4d72-b419-b951aa223c76");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
}
