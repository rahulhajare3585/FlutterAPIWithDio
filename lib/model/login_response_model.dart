class LoginRespModel {
  LoginResult result;
  dynamic targetUrl; // Use `dynamic` for a field that can be of different types
  bool success;
  APIErrorModel? error; // Assuming APIErrorModel can be null
  bool unAuthorizedRequest;
  bool abp; // Renamed to avoid conflicts with Dart's reserved keyword

  LoginRespModel({
    required this.result,
    required this.targetUrl,
    required this.success,
    this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory LoginRespModel.fromJson(Map<String, dynamic> json) {
    return LoginRespModel(
      result: LoginResult.fromJson(json['result']),
      targetUrl: json['targetUrl'],
      success: json['success'],
      error:
          json['error'] != null ? APIErrorModel.fromJson(json['error']) : null,
      unAuthorizedRequest: json['unAuthorizedRequest'],
      abp: json['__abp'],
    );
  }
}

class LoginResult {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  bool shouldResetPassword;
  dynamic passwordResetCode;
  int userId;
  bool requiresTwoFactorVerification;
  dynamic twoFactorAuthProviders;
  dynamic twoFactorRememberClientToken;
  dynamic returnUrl;
  String refreshToken;
  int refreshTokenExpireInSeconds;
  String userName;
  bool canDeleteMasterTemplate;

  LoginResult({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    this.passwordResetCode,
    required this.userId,
    required this.requiresTwoFactorVerification,
    this.twoFactorAuthProviders,
    this.twoFactorRememberClientToken,
    this.returnUrl,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,
    required this.userName,
    required this.canDeleteMasterTemplate,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      accessToken: json['accessToken'],
      encryptedAccessToken: json['encryptedAccessToken'],
      expireInSeconds: json['expireInSeconds'],
      shouldResetPassword: json['shouldResetPassword'],
      passwordResetCode: json['passwordResetCode'],
      userId: json['userId'],
      requiresTwoFactorVerification: json['requiresTwoFactorVerification'],
      twoFactorAuthProviders: json['twoFactorAuthProviders'],
      twoFactorRememberClientToken: json['twoFactorRememberClientToken'],
      returnUrl: json['returnUrl'],
      refreshToken: json['refreshToken'],
      refreshTokenExpireInSeconds: json['refreshTokenExpireInSeconds'],
      userName: json['userName'],
      canDeleteMasterTemplate: json['canDeleteMasterTemplate'],
    );
  }
}

class APIErrorModel {
  int code;
  String? message; // Nullable type in Dart
  String? details; // Nullable type in Dart
  List<APIValidationError>? validationErrors; // Nullable list

  APIErrorModel({
    required this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  factory APIErrorModel.fromJson(Map<String, dynamic> json) {
    return APIErrorModel(
      code: json['code'],
      message: json['message'],
      details: json['details'],
      validationErrors: json['validationErrors'] != null
          ? (json['validationErrors'] as List)
              .map((e) => APIValidationError.fromJson(e))
              .toList()
          : null,
    );
  }
}

class APIValidationError {
  String? message; // Nullable type in Dart
  List<String>? members; // Nullable list

  APIValidationError({this.message, this.members});

  factory APIValidationError.fromJson(Map<String, dynamic> json) {
    return APIValidationError(
      message: json['message'],
      members:
          json['members'] != null ? List<String>.from(json['members']) : null,
    );
  }
}
