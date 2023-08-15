import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failure.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_qoute/domain/entities/quote.dart';
import 'package:quotes/features/random_qoute/domain/respositories/quote_repository.dart';

import '../data_sources/local/random_quote_local_data_source.dart';
import '../data_sources/remote/random_quote_remote_data_source.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final randomQuote = await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(
          quoteModel: randomQuote,
        );
        return right(randomQuote);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final randomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return right(randomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
