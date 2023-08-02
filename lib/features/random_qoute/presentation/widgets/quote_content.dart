import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            'measuring programming progress measuring programming progress measuring programming progress measuring programming progress measuring programming progress',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              'Bill Gates',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
