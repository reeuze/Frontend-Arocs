class InventoryModel {
  final String itemUID;
  final String itemName;
  final int itemCount;

  InventoryModel({
    required this.itemUID,
    required this.itemName,
    required this.itemCount,
  });

  factory InventoryModel.fromMap(Map<String, dynamic> data) {
    return InventoryModel(
      itemUID: data['itemUID'] ?? '',
      itemName: data['itemName'] ?? '',
      itemCount: data['itemCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemUID': itemUID,
      'itemName': itemName,
      'itemCount': itemCount,
    };
  }

  InventoryModel copyWith({
    String? itemUID,
    String? itemName,
    int? itemCount,
  }) {
    return InventoryModel(
      itemUID: itemUID ?? this.itemUID,
      itemName: itemName ?? this.itemName,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
