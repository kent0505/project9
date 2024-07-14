import 'package:flutter/material.dart';

import '../../../core/utils.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 38),
      padding: const EdgeInsets.symmetric(horizontal: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            blurRadius: 50,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Row(
            children: [
              SizedBox(width: 4),
              Text(
                'Your total balance',
                style: TextStyle(
                  color: Color(0xff3A3A3A),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 4),
              Text(
                '\$${getTotalBalance()}',
                style: const TextStyle(
                  color: Color(0xff2D99FF),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MontserratB',
                ),
              ),
            ],
          ),
          const SizedBox(height: 27),
          // BAR CHART WIDGET HERE
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
