import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:link_redirect/green_promo_screen.dart';
import 'package:link_redirect/red_promo_screen.dart';
import 'package:uni_links/uni_links.dart';

class ContextUtility {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ContextUtilityNavigatorKey');
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static bool get hasNavigator => navigatorKey.currentState != null;
  static NavigatorState? get navigator => navigatorKey.currentState;

  static bool get hasContext => navigator?.overlay?.context != null;
  static BuildContext? get context => navigator?.overlay?.context;
}

class UniLinksService {
  static String _promoId = '';
  static String get promoId => _promoId;
  static bool get hasPromoId => _promoId.isNotEmpty;

  static void reset() => _promoId = '';

  static Future<void> init({checkActualVersion = false}) async {
    print("----------Running--------------");
    // This is used for cases when: APP is not running and the user clicks on a link.
    try {
      final Uri? uri = await getInitialUri();
      _uniLinkHandler(uri: uri);
    } on PlatformException {
      if (kDebugMode) print("(PlatformException) Failed to receive initial uri.");
    } on FormatException catch (error) {
      if (kDebugMode) print("(FormatException) Malformed Initial URI received. Error: $error");
    }

    // This is used for cases when: APP is already running and the user clicks on a link.
    uriLinkStream.listen((Uri? uri) async {
      print("----------Running--------------");
      _uniLinkHandler(uri: uri);
    }, onError: (error) {
      if (kDebugMode) print('UniLinks onUriLink error: $error');
    });
  }

  static Future<void> _uniLinkHandler({required Uri? uri}) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> params = uri.queryParameters;

    String receivedPromoId = params['promo-id'] ?? '';
    if (receivedPromoId.isEmpty) return;
    _promoId = receivedPromoId;

    if (_promoId == 'ABC1') {
      ContextUtility.navigator?.push(
        MaterialPageRoute(builder: (_) => const GreenPromoScreen()),
      );
    }

    if (_promoId == 'ABC2') {
      ContextUtility.navigator?.push(
        MaterialPageRoute(builder: (_) => const RedPromoScreen()),
      );
    }
  }
}