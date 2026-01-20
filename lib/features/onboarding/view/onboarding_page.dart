import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subflow_app/core/constants/storage_keys.dart';
import 'package:subflow_app/features/onboarding/widgets/widgets.dart';
import 'package:subflow_app/features/paywall/widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isLoading = false;

  Future<void> _handleContinue() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      final prefs = await SharedPreferences.getInstance();
      final hasSubscription =
          prefs.getBool(StorageKeys.userHasSubscription) ?? false;
      if (hasSubscription) {
        context.go('/home');
      } else {
        context.go('/paywall');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Добро пожаловать',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: OnboardingTitleSection(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PaywallContinueButton(
                  onPressed: _handleContinue,
                  isLoading: _isLoading,
                  label: 'Продолжить',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
