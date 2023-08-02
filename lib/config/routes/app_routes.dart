import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/favourite_qoute/presentation/screens/favourite_quote_screen.dart';
import 'package:quotes/features/random_qoute/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteQuoteRoute = '/favouriteQuote';
}

// final routes = {
//   Routes.initialRoute: (context) => const QuoteScreen(),
//   Routes.favouriteQuoteRoute: (context) => const FavouriteQuoteScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const QuoteScreen(),
        );
      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteQuoteScreen(),
        );
      default:
        return null;
    }
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
