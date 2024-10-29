class ReqModel {
  String emailId;
  String password;

  ReqModel({required this.emailId, required this.password});

  // Optional: Convert a ReqModel instance to a Map for easy serialization
  Map<String, dynamic> toJson() {
    return {
      'emailId': emailId,
      'password': password,
    };
  }

  // Optional: Create a ReqModel instance from a Map (useful for deserialization)
  factory ReqModel.fromJson(Map<String, dynamic> json) {
    return ReqModel(
      emailId: json['emailId'],
      password: json['password'],
    );
  }
}
