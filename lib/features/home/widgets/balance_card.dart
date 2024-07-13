import 'package:flutter/material.dart';

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
      child: const Column(
        children: [
          SizedBox(height: 32),
          Row(
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
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 4),
              Text(
                '\$8500',
                style: TextStyle(
                  color: Color(0xff2D99FF),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MontserratB',
                ),
              ),
            ],
          ),
          SizedBox(height: 27),
          // BAR CHART WIDGET HERE
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
