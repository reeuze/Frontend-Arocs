enum RobotStatus { ready, working, unavailable }

class RobotModel {
  String robotUid;
  RobotStatus robotStatus;

  // Constructor
  RobotModel({required this.robotUid, required this.robotStatus});

  // Factory constructor to create a RobotModel from a map
  factory RobotModel.fromMap(Map<String, dynamic> data) {
    return RobotModel(
      robotUid: data['robotUid'],
      // Convert the string from the map back to RobotStatus enum
      robotStatus: RobotStatus.values.firstWhere(
          (status) => status.toString().split('.').last == data['robotStatus']),
    );
  }

  // Method to convert a RobotModel into a map
  Map<String, dynamic> toMap() {
    return {
      'robotUid': robotUid,
      // Convert the RobotStatus enum to its string representation
      'robotStatus': robotStatus.toString().split('.').last,
    };
  }

  // CopyWith function to create a copy with optional changes
  RobotModel copyWith({String? robotUid, RobotStatus? robotStatus}) {
    return RobotModel(
      robotUid: robotUid ?? this.robotUid,
      robotStatus: robotStatus ?? this.robotStatus,
    );
  }
}

