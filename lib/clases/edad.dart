class AgePrediction {
  final String name;
  final int age;

  AgePrediction({required this.name, required this.age});

  factory AgePrediction.fromJson(Map<String, dynamic> json) {
    return AgePrediction(
      name: json['name'],
      age: json['age'],
    );
  }
}