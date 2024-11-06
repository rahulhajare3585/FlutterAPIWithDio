class Provider {
  final int id;
  final String name;
  final String serviceIds;
  final String? providerGroup;

  Provider({
    required this.id,
    required this.name,
    required this.serviceIds,
    this.providerGroup,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'] ?? 0, // Default to 0 if 'id' is null
      name: json['name'] ?? '', // Default to empty string if 'name' is null
      serviceIds: json['serviceIds'] ?? '', // Default to empty string
      providerGroup: json['providerGroup'], // Nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'serviceIds': serviceIds,
      'providerGroup': providerGroup,
    };
  }
}

class ProviderResponseModel {
  final String? targetUrl;
  final bool success;
  final String? error;
  final bool unAuthorizedRequest;
  final bool abp;
  final List<Provider> result;

  ProviderResponseModel({
    this.targetUrl,
    required this.success,
    this.error,
    required this.unAuthorizedRequest,
    required this.abp,
    required this.result,
  });

  factory ProviderResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List<dynamic>? ?? [];
    List<Provider> providerList =
        list.map((i) => Provider.fromJson(i)).toList();

    return ProviderResponseModel(
      targetUrl: json['targetUrl'],
      success: json['success'] ?? false,
      error: json['error'],
      unAuthorizedRequest: json['unAuthorizedRequest'] ?? false,
      abp: json['abp'] ?? false,
      result: providerList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'targetUrl': targetUrl,
      'success': success,
      'error': error,
      'unAuthorizedRequest': unAuthorizedRequest,
      'abp': abp,
      'result': result.map((provider) => provider.toJson()).toList(),
    };
  }
}
