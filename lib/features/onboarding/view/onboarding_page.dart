import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Welcome to the App'),
              floating: true,
              // flexibleSpace: FlexibleSpaceBar(
              //   background: Image.asset(
              //     'assets/onboarding_image.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(title: Text('Feature 1')),
                ListTile(title: Text('Feature 2')),
                ListTile(title: Text('Feature 3')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
