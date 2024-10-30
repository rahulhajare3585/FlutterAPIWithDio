class LoginModel {
  String userNameOrEmailAddress;
  String password;
  String? twoFactorVerificationCode;
  bool? rememberClient;
  String? twoFactorRememberClientToken;
  bool? singleSignIn;
  String? returnUrl;
  String? captchaResponse;
  int? tenantId;

  LoginModel({
    required this.userNameOrEmailAddress,
    required this.password,
    this.twoFactorVerificationCode,
    this.rememberClient,
    this.twoFactorRememberClientToken,
    this.singleSignIn,
    this.returnUrl,
    this.captchaResponse,
    this.tenantId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userNameOrEmailAddress': userNameOrEmailAddress,
      'password': password,
      'twoFactorVerificationCode': twoFactorVerificationCode,
      'rememberClient': rememberClient,
      'twoFactorRememberClientToken': twoFactorRememberClientToken,
      'singleSignIn': singleSignIn,
      'returnUrl': returnUrl,
      'captchaResponse': captchaResponse,
      'tenantId': tenantId,
    };
  }
}
