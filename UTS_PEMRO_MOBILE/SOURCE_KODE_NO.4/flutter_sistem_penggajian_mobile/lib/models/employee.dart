class Employee {
  int? id; // id database (auto increment)
  String name;
  String position;
  double baseSalary;
  double allowance;
  double deduction;

  Employee({
    this.id,
    required this.name,
    required this.position,
    required this.baseSalary,
    required this.allowance,
    required this.deduction,
  });

  double get totalSalary => baseSalary + allowance - deduction;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'baseSalary': baseSalary,
      'allowance': allowance,
      'deduction': deduction,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as int?,
      name: map['name'] as String,
      position: map['position'] as String,
      baseSalary: (map['baseSalary'] as num).toDouble(),
      allowance: (map['allowance'] as num).toDouble(),
      deduction: (map['deduction'] as num).toDouble(),
    );
  }
}
