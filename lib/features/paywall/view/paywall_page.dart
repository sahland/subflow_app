import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subflow_app/core/constants/storage_keys.dart';
import 'package:subflow_app/features/paywall/widgets/widgets.dart';
import 'package:subflow_app/uikit/widgets/widgets.dart';

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  int _selectedSubscription = 0;
  bool _isLoading = false;

  Future<void> _handleContinue() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final subscriptionType =
        _selectedSubscription == 0 ? 'monthly' : 'yearly';
    await prefs.setString(StorageKeys.userSubscription, subscriptionType);
    await prefs.setBool(StorageKeys.userHasSubscription, true);

    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Подписка активирована!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: AppBarTitle(title: 'Подписка'),
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
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Выберите подписку',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Получите полный доступ ко всем возможностям приложения',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                PaywallSubscriptionCard(
                  title: 'Месячная подписка',
                  subtitle: 'Отменить можно в любой момент',
                  price: '₽249/месяц',
                  isSelected: _selectedSubscription == 0,
                  onTap: () => setState(() => _selectedSubscription = 0),
                  showDiscount: false,
                ),
                PaywallSubscriptionCard(
                  title: 'Годовая подписка',
                  subtitle: 'Самый выгодный вариант',
                  price: '₽1990/год',
                  isSelected: _selectedSubscription == 1,
                  onTap: () => setState(() => _selectedSubscription = 1),
                  showDiscount: true,
                  discountText: 'Сэкономишь 1000 ₽',
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PaywallContinueButton(
                  onPressed: _handleContinue,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
