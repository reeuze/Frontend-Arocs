enum FlowInStatus { waiting, ongoing, done }

class FlowInModel {
  final String flowInUID;
  final int flowInQuantity;
  final int totalQuantity;
  final DateTime flowInDate;
  final FlowInStatus flowInStatus;

  FlowInModel({
    required this.flowInUID,
    required this.flowInQuantity,
    required this.totalQuantity,
    required this.flowInDate,
    required this.flowInStatus,
  });

  factory FlowInModel.fromMap(Map<String, dynamic> data) {
    return FlowInModel(
      flowInUID: data['flowInUID'],
      flowInQuantity: data['flowInQuantity'],
      totalQuantity: data['totalQuantity'],
      flowInDate: DateTime.parse(data['flowInDate']), // Parse date string to DateTime
      flowInStatus: FlowInStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data['flowInStatus'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flowInUID': flowInUID,
      'flowInQuantity': flowInQuantity,
      'totalQuantity': totalQuantity,
      'flowInDate': flowInDate.toIso8601String(), // Convert DateTime to string
      'flowInStatus': flowInStatus.toString().split('.').last, // Convert enum to string
    };
  }

  FlowInModel copyWith({
    String? flowInUID,
    int? flowInQuantity,
    int? totalQuantity,
    DateTime? flowInDate,
    FlowInStatus? flowInStatus,
  }) {
    return FlowInModel(
      flowInUID: flowInUID ?? this.flowInUID,
      flowInQuantity: flowInQuantity ?? this.flowInQuantity,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      flowInDate: flowInDate ?? this.flowInDate,
      flowInStatus: flowInStatus ?? this.flowInStatus,
    );
  }
}
