import 'package:flutter/foundation.dart';
import '../models/dog.dart';

class WorkoutProvider extends ChangeNotifier {
  Dog? _dog;
  List<String> _plan = [];

  Dog? get dog => _dog;
  List<String> get plan => List.unmodifiable(_plan);

  void setDog(Dog dog) {
    _dog = dog;
    notifyListeners();
  }

  void generatePlan() {
    if (_dog == null) return;
    _plan = [
      "Walk 20 min – warmup",
      "Trot intervals – 10 x 1 min",
      "Sniff break enrichment",
      "Cool‑down walk 10 min",
    ];
    notifyListeners();
  }
}
