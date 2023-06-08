class User {
  String? name;
  String? email;
  String? mobile;
  int? userType;
  String? password;
  bool? twoStepVerification;
  bool? deviceAuthenticator;
  bool? otpVerification;

  User({
    this.name,
    this.email,
    this.mobile,
    this.userType,
    this.password,
    this.twoStepVerification,
    this.deviceAuthenticator,
    this.otpVerification,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': mobile,
      'user_type': userType,
      'password': password,
      'two_step_verification': twoStepVerification,
      'device_authenticator': deviceAuthenticator,
      'otp_verification': otpVerification,
    };
  }
}

