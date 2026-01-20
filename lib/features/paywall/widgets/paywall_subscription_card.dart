import 'package:flutter/material.dart';

class PaywallSubscriptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showDiscount;
  final String? discountText;

  const PaywallSubscriptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
    this.showDiscount = false,
    this.discountText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: isSelected ? 4 : 1,
          color: isSelected ? theme.colorScheme.primaryContainer : null,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Radio<bool>(
                      value: true,
                      groupValue: isSelected,
                      onChanged: (_) => onTap(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    if (showDiscount && discountText != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          discountText!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
