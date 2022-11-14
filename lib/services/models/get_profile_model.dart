class Profile {
  bool? error;
  String? message;
  Data? data;

  Profile({this.error, this.message, this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String fullName;
  String phoneNumber;
  String? phoneNumberVerifiedAt;
  String email;
  Null? emailVerifiedAt;
  Null? gender;
  Null? dateOfBirth;
  Null? profilePhotoUrl;
  String? userType;

  Data(
      {this.userId,
         required this.fullName,
         required this.phoneNumber,
        this.phoneNumberVerifiedAt,
      required this.email,
        this.emailVerifiedAt,
        this.gender,
        this.dateOfBirth,
        this.profilePhotoUrl,
        this.userType});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['phone_number_verified_at'] = this.phoneNumberVerifiedAt;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['user_type'] = this.userType;
    return data;
  }
}
