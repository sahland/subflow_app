import 'package:flutter/material.dart';

class HomeListItemCard extends StatelessWidget {
  final int index;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback? onTap;

  const HomeListItemCard({
    super.key,
    required this.index,
    this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: ListTile(
          title: Text(title ?? 'Элемент ${index + 1}'),
          subtitle: Text(subtitle ?? 'Описание элемента ${index + 1}'),
          leading: leading ?? CircleAvatar(
            child: Text('${index + 1}'),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
