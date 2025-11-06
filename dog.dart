class Dog {
  final String name;
  final double weightKg;
  final int ageYears;

  Dog({required this.name, required this.weightKg, required this.ageYears});

  Map<String, dynamic> toJson() => {
    'name': name,
    'weightKg': weightKg,
    'ageYears': ageYears,
  };

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
    name: json['name'] ?? 'Doggo',
    weightKg: (json['weightKg'] ?? 10).toDouble(),
    ageYears: json['ageYears'] ?? 1,
  );
}
