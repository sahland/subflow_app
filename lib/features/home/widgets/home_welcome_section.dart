import 'package:flutter/material.dart';

class HomeWelcomeSection extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const HomeWelcomeSection({
    super.key,
    this.title = 'Добро пожаловать!',
    this.description = 'Это главный экран приложения Subflow.',
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
            style: titleStyle ?? theme.textTheme.headlineMedium?.copyWith(
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
