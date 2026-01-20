import 'package:flutter/material.dart';

class OnboardingTitleSection extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const OnboardingTitleSection({
    super.key,
    this.title = 'Добро пожаловать в приложение!',
    this.description =
        'Это лучшее место для начала вашего путешествия с нами.',
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ??
                theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: descriptionStyle ?? theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
