class AdviceSlip {
  int id;
  String advice;

  AdviceSlip({
    required this.id,
    required this.advice,
  });

  factory AdviceSlip.fromJson(Map<String, dynamic> json) {
    return AdviceSlip(
      id: json['id'],
      advice: json['advice'],
    );
  }

  @override
  String toString() => 'AdviceSlip: (id: $id, advice: $advice)';
}