
class OtpPhysBody{
  String phone;
  String otpCode;

  OtpPhysBody({
    required this.phone,
    required this.otpCode,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phone;
    data['otp'] = this.otpCode;
    return data;
  }
}