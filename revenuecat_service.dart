import 'dart:async';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../common/constants.dart';

class RevenueCatService {
  static final RevenueCatService _instance = RevenueCatService._internal();
  factory RevenueCatService() => _instance;
  RevenueCatService._internal();

  bool _configured = false;
  CustomerInfo? _customerInfo;

  Future<void> configure({String? apiKey}) async {
    final key = apiKey ?? RCConstants.publicApiKey;
    if (key == 'REVENUECAT_PUBLIC_SDK_KEY') {
      // Placeholder key: skip real configure to avoid runtime errors before setup
      _configured = false;
      return;
    }
    final config = PurchasesConfiguration(key);
    await Purchases.configure(config);
    _customerInfo = await Purchases.getCustomerInfo();
    _configured = true;
  }

  bool get isConfigured => _configured;
  bool get isPro {
    final entitlements = _customerInfo?.entitlements.active;
    return entitlements?.containsKey(RCConstants.entitlementPro) ?? false;
  }

  Future<bool> refreshCustomerInfo() async {
    if (!_configured) return false;
    _customerInfo = await Purchases.getCustomerInfo();
    return isPro;
  }

  Future<bool> purchasePro() async {
    if (!_configured) return false;
    try {
      final offerings = await Purchases.getOfferings();
      final offering = offerings.current ?? offerings.all[RCConstants.offeringDefault];
      if (offering == null || offering.availablePackages.isEmpty) return false;
      final pkg = offering.availablePackages.first;
      final info = await Purchases.purchasePackage(pkg);
      _customerInfo = info;
      return isPro;
    } on Exception {
      return false;
    }
  }

  Future<void> restorePurchases() async {
    if (!_configured) return;
    _customerInfo = await Purchases.restorePurchases();
  }
}
