import 'package:flutter/material.dart';
import 'package:new_task/utils/chrome_custom_tabs.dart';
import 'package:new_task/variables/local_variables.dart';
import 'package:new_task/variables/modal_variable.dart';
import 'package:new_task/widgets/commonbottombaritem.dart';
import 'package:new_task/widgets/commonboxnew.dart';
import 'package:new_task/widgets/commonmincoinbar.dart';
import 'package:new_task/widgets/commontop.dart';
import 'package:new_task/widgets/help.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  late SharedPreferences _prefs;

  Future<void> _refreshData() async {
    int updatedCoins = await SharedPreferences.getInstance().then((prefs) {
      return prefs.getInt(gameCoinsLabel) ?? 0;
    });

    // Update UI
    setState(() {
      gameCoins = updatedCoins;
    });
  }

  @override
  void initState() {
    super.initState();
    if (phase != 0 && gameCoins >= phase) {
      _initializeSharedPreferences();
    }
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // print(phase);
    print(DateTime.fromMillisecondsSinceEpoch(
            _prefs.getInt('${phase}Coin-Completiontime') ?? 0)
        .toString()
        .runtimeType);
    print(DateTime.fromMillisecondsSinceEpoch(
            _prefs.getInt('12000Coin-Completiontime') ?? 0)
        .toString());

    if (DateTime.fromMillisecondsSinceEpoch(
                    _prefs.getInt('${phase}Coin-Completiontime') ?? 0)
                .toString() !=
            '' &&
        DateTime.fromMillisecondsSinceEpoch(
                    _prefs.getInt('${phase}Coin-Completiontime') ?? 0)
                .toString() ==
            '1970-01-01 05:30:00.000') {
      _prefs.setInt(
          '${phase}Coin-Completiontime', DateTime.now().millisecondsSinceEpoch);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(phase);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 67,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (objLive)
                  InkWell(
                    onTap: () {
                      launchCustomTabURL(
                          context, otherLinksModel.otherlinks![4].link);
                    },
                    child: const CommonBottomBarItem(
                      text: "Redeem",
                      size: 30,
                      img: "assets/images/wallet.png",
                    ),
                  ),
                if (objLive)
                  InkWell(
                    onTap: () {
                      launchCustomTabURL(
                          context, otherLinksModel.otherlinks![1].link);
                    },
                    child: const CommonBottomBarItem(
                      text: "History",
                      size: 30,
                      img: "assets/images/cash-flow.png",
                    ),
                  ),
                if (objLive)
                  InkWell(
                    onTap: () {
                      launchCustomTabURL(
                          context, otherLinksModel.otherlinks![2].link);
                    },
                    child: const CommonBottomBarItem(
                      size: 42,
                      img: "assets/images/spinwheel gif1.gif",
                      text: '',
                    ),
                  ),
                if (objLive)
                  InkWell(
                    onTap: () {
                      launchCustomTabURL(
                          context, otherLinksModel.otherlinks![3].link);
                    },
                    child: const CommonBottomBarItem(
                      size: 50,
                      img: "assets/images/spinwheel gif2.gif",
                      text: '',
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Commontop(
                  refreshCallback: _refreshData,
                ),
                const SizedBox(
                  height: 16,
                ),
                const CommonMinCoinBar(),
                const SizedBox(
                  height: 16,
                ),
                if (phase == 12000 || phase == 0)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonBoxNew(
                        text: 'PLAY',
                        route: '/play',
                        fontSize: 45.0,
                      ),
                      CommonBoxNew(
                        text: 'TASK LINE',
                        route: '/taskline',
                        fontSize: 40.0,
                      ),
                    ],
                  ),
                if (phase == 12000 || phase == 0)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonBoxNew(
                        text: 'HOURLY BONUSES',
                        route: '/bonus',
                        fontSize: 28.0,
                      ),
                      CommonBoxNew(
                        text: 'GAME',
                        route: '/game',
                        fontSize: 40.0,
                      ),
                    ],
                  ),
                if (phase == 15000 || phase == 18000)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonBoxNew(
                        text: 'GAME',
                        route: '/game',
                        fontSize: 40.0,
                      ),
                      NeedHelpBox(route: '/help')
                    ],
                  ),
                if (phase == 12000 || phase == 0 || phase == 20000)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonBoxNew(
                        text: 'MINI TASK',
                        route: '/premium',
                        fontSize: 30.0,
                      ),
                      NeedHelpBox(route: '/help')
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
