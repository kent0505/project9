import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeAdd) return const Text('Add');

                if (state is HomeTransactions) {
                  return const Text('Transactions');
                }

                if (state is HomeMoneyBox) return const Text('MoneyBox');

                return const _Home();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Home'),
      ],
    );
  }
}
