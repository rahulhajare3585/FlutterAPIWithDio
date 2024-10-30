class LoginModel {
  String? userNameOrEmailAddress;
  String? password;
  String? tenancyName;

  LoginModel({this.userNameOrEmailAddress, this.password, this.tenancyName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userNameOrEmailAddress = json['userNameOrEmailAddress'];
    password = json['password'];
    tenancyName = json['tenancyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userNameOrEmailAddress'] = this.userNameOrEmailAddress;
    data['password'] = this.password;
    data['tenancyName'] = this.tenancyName;
    return data;
  }
}
