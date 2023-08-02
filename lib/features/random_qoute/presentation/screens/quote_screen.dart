import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_qoute/presentation/widgets/quote_content.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
        ),
      ),
      body: Column(
        children: [
          const QuoteContent(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15,),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: const Icon(
              Icons.refresh,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
