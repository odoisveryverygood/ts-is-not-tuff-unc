import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/workouts/workouts_screen.dart';
import 'features/nutrition/nutrition_screen.dart';
import 'features/tracking/tracking_screen.dart';
import 'features/settings/settings_screen.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootKey,
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
    GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
    GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
    GoRoute(path: '/workouts', builder: (_, __) => const WorkoutsScreen()),
    GoRoute(path: '/nutrition', builder: (_, __) => const NutritionScreen()),
    GoRoute(path: '/tracking', builder: (_, __) => const TrackingScreen()),
    GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
  ],
);
