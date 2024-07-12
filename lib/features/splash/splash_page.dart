import 'package:flutter/material.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Container(
              height: 256,
              width: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white),
                image: const DecorationImage(
                  image: AssetImage('assets/splash.png'),
                ),
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              color: AppColors.main,
              strokeWidth: 7,
              strokeAlign: 2,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
