import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatService {
  // TODO: Replace with your RevenueCat public SDK key
  static const String REVENUECAT_API_KEY = "RC_PUBLIC_SDK_KEY_HERE";

  static Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.warn);
    await Purchases.configure(PurchasesConfiguration(REVENUECAT_API_KEY));
  }

  static Future<CustomerInfo> getCustomerInfo() async {
    return await Purchases.getCustomerInfo();
  }

  static Future<Offerings> getOfferings() async {
    return await Purchases.getOfferings();
  }

  static Future<CustomerInfo> purchasePackage(Package pkg) async {
    return await Purchases.purchasePackage(pkg);
  }
}
