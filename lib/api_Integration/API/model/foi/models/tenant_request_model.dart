class TenantRequestModel {
  String? tenancyName;

  TenantRequestModel({this.tenancyName});

  TenantRequestModel.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenancyName'] = this.tenancyName;
    return data;
  }
}
