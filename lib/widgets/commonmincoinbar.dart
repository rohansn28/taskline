import 'package:flutter/material.dart';

class CommonMinCoinBar extends StatelessWidget {
  const CommonMinCoinBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: const Center(
        child: Text(
          textAlign: TextAlign.center,
          'Minimum Coins required is 20000 \n 20000 Coins = 200',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
