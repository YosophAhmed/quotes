import 'dart:convert';

import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_qoute/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  QuoteModel getLastRandomQuote();
  Future<void> cacheQuote({
    required QuoteModel quoteModel,
  });
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  QuoteModel getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(
      AppStrings.cacheQuoteKey,
    );
    if (jsonString != null) {
      return QuoteModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote({required QuoteModel quoteModel}) {
    return sharedPreferences.setString(
      AppStrings.cacheQuoteKey,
      json.encode(quoteModel),
    );
  }
}
