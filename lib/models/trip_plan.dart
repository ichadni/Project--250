class TripPlan {
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String notes;

  TripPlan({
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.notes,
  });

  // Optional: to convert to/from JSON for Firebase or local storage
  Map<String, dynamic> toJson() {
    return {
      'destination': destination,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'notes': notes,
    };
  }

  factory TripPlan.fromJson(Map<String, dynamic> json) {
    return TripPlan(
      destination: json['destination'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      notes: json['notes'],
    );
  }
}
