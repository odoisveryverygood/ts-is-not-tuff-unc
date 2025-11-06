import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../services/revenuecat_service.dart';

class SubscriptionProvider extends ChangeNotifier {
  bool _isPro = false;
  bool get isPro => _isPro;

  Offerings? _offerings;
  Offerings? get offerings => _offerings;

  Future<void> bootstrap() async {
    try {
      final info = await RevenueCatService.getCustomerInfo();
      _isPro = info.entitlements.active.isNotEmpty;
      _offerings = await RevenueCatService.getOfferings();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Subscription bootstrap error: $e");
      }
    }
  }

  Future<void> purchase(Package pkg) async {
    final info = await RevenueCatService.purchasePackage(pkg);
    _isPro = info.entitlements.active.isNotEmpty;
    notifyListeners();
  }
}
