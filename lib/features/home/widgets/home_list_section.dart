import 'package:flutter/material.dart';
import 'package:subflow_app/features/home/widgets/home_list_item_card.dart';

class HomeListSection extends StatelessWidget {
  final int itemCount;
  final String Function(int)? itemTitleBuilder;
  final String Function(int)? itemSubtitleBuilder;
  final Widget Function(int)? itemLeadingBuilder;
  final VoidCallback Function(int)? onItemTap;

  const HomeListSection({
    super.key,
    this.itemCount = 8,
    this.itemTitleBuilder,
    this.itemSubtitleBuilder,
    this.itemLeadingBuilder,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HomeListItemCard(
            index: index,
            title: itemTitleBuilder?.call(index),
            subtitle: itemSubtitleBuilder?.call(index),
            leading: itemLeadingBuilder?.call(index),
            onTap: onItemTap?.call(index),
          );
        },
        childCount: itemCount,
      ),
    );
  }
}
