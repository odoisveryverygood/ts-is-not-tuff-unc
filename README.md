# WoofFit AI — Task 4 Scaffold

This zip contains a minimal Flutter app wired for:
- Firebase Core + Auth + Firestore (placeholders for keys/plists)
- RevenueCat purchases (`purchases_flutter`)
- Basic routing: Login → Home; Paywall modal
- Provider-based state for subscription status
- Corgi-branded placeholder

## Setup

1) **Flutter**
   - Flutter 3.22+ and Dart 3.x

2) **Firebase**
   - Add platform configs:
     - **iOS**: `ios/Runner/GoogleService-Info.plist`
     - **Android**: `android/app/google-services.json`
   - In `main.dart`, set `FirebaseOptions` via `DefaultFirebaseOptions.currentPlatform`
     *or* leave it empty and rely on native files.
   - Add Gradle plugins per Firebase docs (already standard in a base Flutter project).

3) **RevenueCat**
   - Create a project and copy the API key.
   - In `lib/services/revenuecat_service.dart`, set `REVENUECAT_API_KEY`.
   - Create an Offering (e.g. "default") and one product (monthly/annual).

4) **Run**
   ```bash
   flutter pub get
   flutter run
   ```

## Notes
- Replace placeholder logo in `assets/images/corgi.png`.
- Update `PaywallScreen` with your product identifiers and copy changes.
- Update `WorkoutProvider` logic with your real features.
