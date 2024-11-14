enum FlowOutStatus { waiting, ongoing, done }

class FlowOutModel {
  final String flowOutUID;
  final int flowOutQuantity;
  final int totalQuantity;
  final DateTime flowOutDate;
  final FlowOutStatus flowOutStatus;

  FlowOutModel({
    required this.flowOutUID,
    required this.flowOutQuantity,
    required this.totalQuantity,
    required this.flowOutDate,
    required this.flowOutStatus,
  });

  factory FlowOutModel.fromMap(Map<String, dynamic> data) {
    return FlowOutModel(
      flowOutUID: data['flowOutUID'],
      flowOutQuantity: data['flowOutQuantity'],
      totalQuantity: data['totalQuantity'],
      flowOutDate: DateTime.parse(data['flowOutDate']), // Parse date string to DateTime
      flowOutStatus: FlowOutStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data['flowOutStatus'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flowOutUID': flowOutUID,
      'flowOutQuantity': flowOutQuantity,
      'totalQuantity': totalQuantity,
      'flowOutDate': flowOutDate.toIso8601String(), // Convert DateTime to string
      'flowOutStatus': flowOutStatus.toString().split('.').last, // Convert enum to string
    };
  }

  FlowOutModel copyWith({
    String? flowOutUID,
    int? flowOutQuantity,
    int? totalQuantity,
    DateTime? flowOutDate,
    FlowOutStatus? flowOutStatus,
  }) {
    return FlowOutModel(
      flowOutUID: flowOutUID ?? this.flowOutUID,
      flowOutQuantity: flowOutQuantity ?? this.flowOutQuantity,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      flowOutDate: flowOutDate ?? this.flowOutDate,
      flowOutStatus: flowOutStatus ?? this.flowOutStatus,
    );
  }
}
