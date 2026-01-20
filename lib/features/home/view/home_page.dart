import 'package:flutter/material.dart';
import 'package:subflow_app/features/home/widgets/widgets.dart';
import 'package:subflow_app/uikit/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: AppBarTitle(title: 'Главный экран'),
            floating: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Center(
                  child: ThemeButton(),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: HomeWelcomeSection(),
          ),
          HomeListSection(
            itemCount: 8,
          ),
        ],
      ),
    );
  }
}
